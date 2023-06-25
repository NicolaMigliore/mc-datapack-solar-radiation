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
# Initialize datapack
execute unless score $init sr_boolean matches 1 run function sr:init

# Check for time of day
function sr:scripts/daytime_handler

# Start exposure check loop and manage tag "not_covered"
execute as @a if score $is_day sr_boolean matches 1 run function sr:scripts/exposure_handler

# Check for players equipment
execute as @a[tag=not_covered] run function sr:scripts/equipment_handler

#Update radiation exposure status
execute as @a[tag=not_covered,tag=!sr_has_equipment] if score $is_day sr_boolean matches 1 run tag @s add sr_is_radiated
execute as @a[tag=!not_covered] run tag @s remove sr_is_radiated
execute as @a[tag=sr_has_equipment] run tag @s remove sr_is_radiated
execute as @a if score $is_day sr_boolean matches 0 run tag @s remove sr_is_radiated

# Update radiation levels
execute as @a run function sr:scripts/radiation/radiation_manager

# Run radbar
function sr:scripts/radbar/radbar_main
# Run Decontamination
function sr:scripts/decontamination/decont_main
# Run mod radiation
function sr:scripts/mob_radiation/mob_radiation_main

# Restart loop
schedule function sr:main_loop 1s