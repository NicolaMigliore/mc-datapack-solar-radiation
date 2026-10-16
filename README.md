# mc-datapack-solar-radiation
Solar Radiation Datapack. Add a layer of challenge to minecraft survival, by making the sun dangerous for the player.

![Solar Radiation Title](/assets/sr-title.png)

## Intro
**Welcome to Solar Radiation!**

You find yourself in a post apocalyptic world. The planet has moved closer to the sun, the earth's atmosphere has thinned and with it, the protection it provided.

Solar radiation is poisonous and can lead to death, so to survive in this new world you will have to avoid the sun as much as possible. Live under ground or in shelters and only venture out at night.

## Data pack goal
This data pack adds new radiation mechanics designed to encourage players to venture out at night and make preparations before braving the sunlight.

Build a secure bunker, a grand underground city or revert to a cave dwelling lifestyle. 
As always, how you chose to play is up to you, now you simply have a new threat to take into consideration!


## Features
### Radiation mechanic
The sun is toxic, if you stay under the sun for too long you will gain radiation poisoning which will bring you several side effects.

![Radiation level indicator](/assets/screenshots/05-radbar.png)

### Radiation spread
If you get radiation poisoning, not only will your health suffer, but you may risk spreading the sickness to nearby mobs. Always be aware of your radiation level and develop a protocol to avoid incidents.

![Mob contamination](/assets/screenshots/06-mob-contamination.png)

### Hazmat suits
Need to go outside? The you may want to dress for the occasion. You can craft hazmat suits that will keep you safe. However, nothing lasts for ever so you may need to keep an eye on your equipment durability.

![Crafting hazmat suit](/assets/screenshots/01-hazmat-suit-craft.png)

### Decontamination potions
To quickly clear radiation poisoning you will need to brew decontamination potions. This will let you clear all radiations from players and mobs.

![Decontamination kit](/assets/screenshots/03-decont-kit.png)

### Advancements
Custom advancements will guide players through the new mechanics as well as offer some end goals.

![Custom advancements](/assets/screenshots/04-custom-advancements.png)

## Notes
- This checkout targets **Minecraft Java Edition 26.3**. Use the matching datapack and resource pack together; older releases are retained in `dist/`.
- Solar Radiation comes with a companion resource pack; find it [here](https://github.com/NicolaMigliore/mc-datapack-solar-radiation) or on the project's [GitHub page](https://github.com/NicolaMigliore/mc-datapack-solar-radiation)
- Currently supports up to 4 players (more to come in the future).

## Installation for Minecraft Java 26.3
1. Put `dist/solar-radiation_mc_26.3.zip` in your world's `datapacks` folder, replacing the previous Solar Radiation datapack.
2. Put `dist/solar-radiation-resourcepack_mc_26.3.zip` in Minecraft's `resourcepacks` folder and enable it, replacing the previous resource pack.
3. Open the world in Minecraft Java 26.3, or run `/reload` if it is already open. When upgrading an existing world, make a backup first.

The migration updates pack metadata, the Overworld clock query, loot functions and predicates, recipe advancements, book navigation, and the decontamination kit's block states. It retains the existing radiation thresholds, crafting ingredients, and four-player limit. This version uses data pack format 121.0 and resource pack format 97.1; see the [official 26.3 release notes](https://www.minecraft.net/en-us/article/minecraft-java-edition-26-3).

## Developer validation (optional)
With Python 3 and Java 25 installed, download the official Java 26.3 server JAR and run:

```text
python scripts/validate.py --server-jar /path/to/server.jar
```

The script checks JSON, function references, and internal resource-pack references, then runs Minecraft's GameTest server in a new temporary directory. It loads the complete datapack and checks installation, day/night detection, generated items, armor durability and breakage, ingredient consumption, the luck predicate, and kit rendering and refresh. Logs and the test world stay in that temporary directory.

In-game checks still needed: join and reconnect with the companion resource pack enabled, inspect item and armor textures and book links, craft the hazmat suit, test exposed versus sheltered radiation, place and brew with a decontamination kit, splash players and mobs with a decontamination potion, and repeat `/reload` with multiple players and placed kits.
