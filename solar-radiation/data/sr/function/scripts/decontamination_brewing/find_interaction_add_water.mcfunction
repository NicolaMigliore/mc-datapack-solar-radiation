scoreboard players set $_sr_find_brewer sr_boolean 0
execute on target store result score $_sr_find_brewer sr_boolean if entity @s[tag=sr_adding_water_to_kit]

execute if score $_sr_find_brewer sr_boolean matches 1 at @s run particle happy_villager ~ ~0.5 ~ 0 0 0 0 1
execute if score $_sr_find_brewer sr_boolean matches 1 if score @s sr_decont_kit_lvl matches 0 run function sr:scripts/decontamination_brewing/increase_cauldron_level

# Remove knowledge of player
execute if score $_sr_find_brewer sr_boolean matches 1 run data remove entity @s interaction