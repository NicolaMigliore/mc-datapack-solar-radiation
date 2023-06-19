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
execute as @a if score $is_day sr_boolean matches 1 run function sr:scripts/equipment_handler

# Check for time of day
function sr:scripts/daytime_handler

# Update radiation levels
function sr:scripts/radiation/radiation_manager

# Run radbar
function sr:scripts/radbar/radbar_main

# Restart loop
schedule function sr:main_loop 1s