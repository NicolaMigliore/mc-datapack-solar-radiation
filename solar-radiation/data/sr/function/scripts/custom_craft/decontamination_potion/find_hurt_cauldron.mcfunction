scoreboard players set $_sr_find_attacker sr_boolean 0
execute on attacker store result score $_sr_find_attacker sr_boolean if entity @s[tag=sr_is_breaking_decont_kit]

execute if score $_sr_find_attacker sr_boolean matches 1 at @s run function sr:scripts/custom_craft/decontamination_potion/pickup_decont_kit

# Remove knowledge of attacker
execute if score $_sr_find_attacker sr_boolean matches 1 run data remove entity @s attack