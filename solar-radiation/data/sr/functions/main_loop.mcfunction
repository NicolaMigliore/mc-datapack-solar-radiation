#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Main loop function gets called every game tick.             #
#                                                                   #
#####################################################################
# # sr_boolean is a scoreboard that will be used to store boolean vars.
# scoreboard objectives add sr_boolean dummy

# Initialize datapack
execute unless score $init sr_boolean matches 1 run function sr:init

# Check for players equipment
execute as @a run function sr:scripts/equipment_handler

# Check for time of day
function sr:scripts/daytime_handler

# Update radiation levels
scoreboard players set @a sr_is_radiated 0
execute as @a if score @s sr_raycast matches 320 if score @s sr_has_equipment matches 0 if score $is_day sr_boolean matches 1 run scoreboard players set @s sr_is_radiated 1

execute as @a if score @s sr_is_radiated matches 1 run scoreboard players add @s sr_rad_levels 1
execute as @a if score @s sr_is_radiated matches 0 if score @s sr_rad_levels matches 1.. run scoreboard players remove @s sr_rad_levels 1


# Apply effect if player is exposed and has no equipment
# execute as @a if score @s sr_raycast matches 320 if score @s sr_has_equipment matches 0 if score $is_day sr_boolean matches 1 run effect give @s poison 5 1

# Add effects
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_1 sr_int run effect give @a minecraft:mining_fatigue 30
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_2 sr_int run effect give @a minecraft:nausea 10
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_3 sr_int run effect give @a minecraft:poison 5
# Remove effects
# execute as @a if score @s sr_rad_levels matches 0 run effect clear @a minecraft:mining_fatigue
# execute as @a if score @s sr_rad_levels < $_sr_rad_level_1 sr_int run effect clear @a minecraft:nausea
# execute as @a if score @s sr_rad_levels < $_sr_rad_level_2 sr_int run effect clear @a minecraft:poison