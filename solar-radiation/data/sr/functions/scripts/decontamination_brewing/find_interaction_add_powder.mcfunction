scoreboard players set $_sr_find_brewer sr_boolean 0
execute on target store result score $_sr_find_brewer sr_boolean if entity @s[tag=sr_adding_powder_to_kit]

# Execute commands for the correct decontamination kit
execute if score $_sr_find_brewer sr_boolean matches 1 at @s run particle happy_villager ~ ~0.5 ~ 0 0 0 0 1
execute if score $_sr_find_brewer sr_boolean matches 1 if score @s sr_decont_has_powder matches 0 run function sr:scripts/decontamination_brewing/place_powder_in_cauldron

# Remove knowledge of player
execute if score $_sr_find_brewer sr_boolean matches 1 run data remove entity @s interaction