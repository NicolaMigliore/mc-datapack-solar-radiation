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
function srfc:main

# Run mod radiation
function sr:scripts/rad_transfer/rad_transfer_main

# Check Advancements
execute as @a[advancements={sr:solar_radiation/take_cover=false},tag=!not_covered] if score $is_day sr_boolean matches 1 run advancement grant @s only sr:solar_radiation/take_cover
execute as @a[advancements={sr:solar_radiation/days/radiation_rookie=false}] if score @s sr_days_survived matches 5 run advancement grant @s only sr:solar_radiation/days/radiation_rookie
execute as @a[advancements={sr:solar_radiation/dats/scavenger=false}] if score @s sr_days_survived matches 20 run advancement grant @s only sr:solar_radiation/days/scavenger
execute as @a[advancements={sr:solar_radiation/days/radiation_tamer=false}] if score @s sr_days_survived matches 50 run advancement grant @s only sr:solar_radiation/days/radiation_tamer
execute as @a[advancements={sr:solar_radiation/days/wasteland_conqueror=false}] if score @s sr_days_survived matches 100 run advancement grant @s only sr:solar_radiation/days/wasteland_conqueror


# Restart loop
schedule function sr:main_loop 1s