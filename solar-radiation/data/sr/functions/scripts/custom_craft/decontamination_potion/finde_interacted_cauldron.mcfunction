scoreboard players set $_sr_find_brewer sr_boolean 0
execute on target store result score $_sr_find_brewer sr_boolean if entity @s[tag=sr_brewing_decont]

# execute if score $_sr_find_brewer sr_boolean matches 1 as @s run say Found Player
execute if score #bool test matches 1 at @s run particle happy_villager ~ ~0.5 ~ 0 0 0 0 1
execute as @s run function sr:scripts/custom_craft/decontamination_potion/reduce_cauldron_level

# Remove knowledge of attacker
execute if score $_sr_find_brewer sr_boolean matches 1 run data remove entity @s interaction