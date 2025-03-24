# Reset kit ingredient acceptance check
scoreboard players set $_sr_take_water sr_boolean 0

# Tag the current interacting player
tag @s add sr_adding_water_to_kit

# Find the correct decontamination kit
execute as @e[type=minecraft:interaction,tag=decont_kit_interaction,distance=..6] run function sr:scripts/decontamination_brewing/find_interaction_add_water

# Take ingredient from player
execute if score $_sr_take_water sr_boolean matches 1 run item modify entity @s weapon.mainhand sr:reduce_stack_count
execute if score $_sr_take_water sr_boolean matches 1 run loot spawn ~ ~ ~ loot sr:glass_bottle

# Revoke advancement and tags
advancement revoke @s only sr:solar_radiation/cauldron_interaction/add_water
tag @s remove sr_adding_water_to_kit