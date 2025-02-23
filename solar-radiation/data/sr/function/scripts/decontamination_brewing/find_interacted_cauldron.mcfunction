scoreboard players set $_sr_find_brewer sr_boolean 0
execute on target store result score $_sr_find_brewer sr_boolean if entity @s[tag=sr_brewing_decont]

# Verify if the player may brew a potion
execute if score $_sr_find_brewer sr_boolean matches 1 if score @s sr_decont_kit_lvl matches 1.. if score @s sr_decont_has_powder matches 1 run scoreboard players set $_sr_kit_can_brew sr_boolean 1

execute if score $_sr_find_brewer sr_boolean matches 1 if score $_sr_kit_can_brew sr_boolean matches 1 at @s run function sr:scripts/decontamination_brewing/reduce_cauldron_level

# Remove knowledge of attacker
execute if score $_sr_find_brewer sr_boolean matches 1 run data remove entity @s interaction