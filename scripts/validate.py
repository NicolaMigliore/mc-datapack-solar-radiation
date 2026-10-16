"""Validate with Java 25 and an official Minecraft 26.3 server JAR.

Usage: python scripts/validate.py --server-jar /path/to/server.jar
All Minecraft output, packs, and world data stay in a new temporary directory.
Uses Mojang's GameTest entry point; does not start a public multiplayer server.
"""

import argparse
import json
import re
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")


def validate_files():
    count = 0
    for folder in ("solar-radiation", "solar-radiation-resourcepack"):
        for path in (ROOT / folder).rglob("*"):
            if path.suffix in (".json", ".mcmeta"):
                json.loads(path.read_text(encoding="utf-8-sig"))
                count += 1
    functions = ROOT / "solar-radiation/data/sr/function"
    known = {"sr:" + p.relative_to(functions).with_suffix("").as_posix()
             for p in functions.rglob("*.mcfunction")}
    for path in functions.rglob("*.mcfunction"):
        for line in path.read_text(encoding="utf-8").splitlines():
            if line.lstrip().startswith("#"):
                continue
            for name in re.findall(r"\bfunction\s+([a-z0-9_.-]+:[a-z0-9_./-]+)", line):
                if name not in known:
                    raise ValueError(f"Missing function {name} in {path}")
    assets = ROOT / "solar-radiation-resourcepack/assets/sr"
    for path in (assets / "items").glob("*.json"):
        model = json.loads(path.read_text())["model"]["model"].split(":")[1]
        if not (assets / "models" / (model + ".json")).is_file():
            raise ValueError(f"Missing item model {model}")
    for path in (assets / "models/item").glob("*.json"):
        for texture in json.loads(path.read_text()).get("textures", {}).values():
            namespace, name = texture.split(":")
            if not (assets.parent / namespace / "textures" / (name + ".png")).is_file():
                raise ValueError(f"Missing item texture {texture}")
    equipment = json.loads((assets / "equipment/hazmat_suit.json").read_text())
    for layer, textures in equipment["layers"].items():
        for texture in textures:
            namespace, name = texture["texture"].split(":")
            if not (assets.parent / namespace / "textures/entity/equipment" / layer / (name + ".png")).is_file():
                raise ValueError(f"Missing equipment texture {texture}")
    print(f"Parsed {count} JSON/metadata files; function references resolved.")


def create_tests(packs):
    pack = packs / "sr-validation"
    write_json(pack / "pack.mcmeta", {"pack": {
        "description": "Solar Radiation integration tests",
        "min_format": [121, 0], "max_format": [121, 0]}})
    data = pack / "data/sr_validation"
    write_json(data / "test_environment/smoke.json", {
        "type": "minecraft:function", "setup": "sr_validation:setup"})
    write_json(data / "test_instance/smoke.json", {
        "type": "minecraft:function", "environment": "sr_validation:smoke",
        "function": "minecraft:always_pass", "max_ticks": 1,
        "setup_ticks": 100, "structure": "minecraft:empty"})
    functions = data / "function"
    functions.mkdir(parents=True)
    (functions / "setup.mcfunction").write_text(
        "forceload add 0 0\nschedule function sr_validation:smoke 2s\n", encoding="utf-8")
    shutil.copyfile(ROOT / "tests/smoke.mcfunction", functions / "smoke.mcfunction")
    armor = []
    for part, slot, durability in (("helmet", "head", 165), ("chestplate", "chest", 240),
                                   ("leggings", "legs", 225), ("boots", "feet", 195)):
        recipe = json.loads((ROOT / f"solar-radiation/data/sr/recipe/hazmat_{part}.json").read_text())
        item = recipe["result"]
        for damage in (0, durability - 1):
            components = dict(item["components"], damage=damage)
            spec = ",".join("minecraft:" + k.split(":")[-1] + "=" + json.dumps(v, separators=(",", ":"))
                            for k, v in components.items())
            armor += [f'item replace entity @e[tag=sr_validation,limit=1] armor.{slot} with {item["id"]}[{spec}]',
                      f'execute as @e[tag=sr_validation,limit=1] run item modify entity @s armor.{slot} sr:damage_hazmat_{part}']
            if damage:
                # The modifier's entity context observes the equipped item from
                # before modification. The next exposure update removes it.
                armor.append(f'execute as @e[tag=sr_validation,limit=1] run item modify entity @s armor.{slot} sr:damage_hazmat_{part}')
                armor.append(f'execute if items entity @e[tag=sr_validation,limit=1] armor.{slot} * run say SR_VALIDATION_FAIL: {part} breakage')
            else:
                armor.append(f'execute unless items entity @e[tag=sr_validation,limit=1] armor.{slot} {item["id"]}[minecraft:damage~{{min:1}}] run say SR_VALIDATION_FAIL: {part} durability')
    (functions / "armor.mcfunction").write_text("\n".join(armor) + "\n", encoding="utf-8")
    render = []
    check_render = []
    for state in range(4):
        x = state * 3
        render += [f'teleport @e[tag=sr_validation,limit=1] {x} 100 4',
                   f'execute as @e[tag=sr_validation,limit=1] at @s run function sr:scripts/decontamination_brewing/render_decont_kit_{state}']
        check_render += ['scoreboard players set #chains sr_test 0',
                         f'execute positioned {x} 100 4 as @e[type=minecraft:block_display,distance=..2,nbt={{block_state:{{id:"minecraft:iron_chain"}}}}] run scoreboard players add #chains sr_test 1',
                         f'execute unless score #chains sr_test matches 2 run say SR_VALIDATION_FAIL: kit render {state}']
    render.append('schedule function sr_validation:check_render 1t')
    check_render += ['execute as @e[tag=sr_validation,limit=1] at @s run function sr:scripts/decontamination_brewing/increase_cauldron_level',
                     'schedule function sr_validation:check_refresh 1t']
    refresh = ['scoreboard players set #chains sr_test 0',
               'execute positioned 9 100 4 as @e[type=minecraft:block_display,distance=..2,nbt={block_state:{id:"minecraft:iron_chain"}}] run scoreboard players add #chains sr_test 1',
               'execute unless score #chains sr_test matches 2 run say SR_VALIDATION_FAIL: kit refresh',
               'scoreboard players set #carriers sr_test 0',
               'execute positioned 9 100 4 as @e[type=minecraft:block_display,distance=..2,nbt={block_state:"minecraft:air"}] run scoreboard players add #carriers sr_test 1',
               'execute unless score #carriers sr_test matches 1 run say SR_VALIDATION_FAIL: kit carrier cleanup',
               'say SR_VALIDATION_COMPLETE']
    (functions / "render.mcfunction").write_text("\n".join(render) + "\n", encoding="utf-8")
    (functions / "check_render.mcfunction").write_text("\n".join(check_render) + "\n", encoding="utf-8")
    (functions / "check_refresh.mcfunction").write_text("\n".join(refresh) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--server-jar", required=True, type=Path)
    args = parser.parse_args()
    server = args.server_jar.resolve()
    with zipfile.ZipFile(server) as jar:
        if "META-INF/versions.list" not in jar.namelist():
            raise ValueError("Use the official bundled server.jar")
        if "26.3" not in jar.read("META-INF/versions.list").decode():
            raise ValueError("The smoke tests require the Minecraft 26.3 server")
    validate_files()
    # The GameTest runner replaces its universe path. Always give it a fresh
    # child of this newly created directory, never a user-supplied world path.
    work = Path(tempfile.mkdtemp(prefix="solar-radiation-test-"))
    packs = work / "packs"
    shutil.copytree(ROOT / "solar-radiation", packs / "solar-radiation")
    create_tests(packs)
    print(f"Validation artifacts: {work}", flush=True)
    command = ["java", "-Xmx1G", "-DbundlerMainClass=net.minecraft.gametest.Main",
               "-jar", str(server), "--packs", str(packs), "--universe", str(work / "world"),
               "--tests", "sr_validation:*", "--report", str(work / "report.xml")]
    with (work / "output.log").open("w", encoding="utf-8") as output:
        result = subprocess.run(command, cwd=work, stdout=output, stderr=subprocess.STDOUT, timeout=180)
    log = (work / "output.log").read_text(encoding="utf-8")
    problems = [line for line in log.splitlines()
                if "/ERROR]" in line or "SR_VALIDATION_FAIL" in line
                or "Failed to load" in line or "Couldn't load" in line
                or "Found validation problem" in line]
    if result.returncode or problems or "SR_VALIDATION_COMPLETE" not in log:
        print("\n".join(problems) or log[-6000:])
        raise SystemExit(f"Validation failed; see {work / 'output.log'}")
    print("Minecraft 26.3 loaded the datapack without errors; all smoke checks passed.")


if __name__ == "__main__":
    main()
