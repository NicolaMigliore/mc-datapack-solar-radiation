#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      #
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Initialize datapack. Should be calle donly once.            #
#                                                                   #
#####################################################################

# Initial install required scoreboard objectives
function sr:install

# Start exposure check loop.
function sr:scripts/exposure_handler

# Init message
tellraw @a [{"text":"Solar Radiation Datapack initialized.", "color":"#77AAAA"}]

# Initialize = true
scoreboard players set $init sr_boolean 1

# Give intro book to players
execute as @a run function sr:scripts/give_intro_book
# Set player rad level
scoreboard players set @a sr_rad_levels 0
scoreboard players set @a sr_is_radiated 0

time set 12001

# Schedule main loop
schedule function sr:main_loop 1s

# FOR DEBUG
scoreboard objectives setdisplay sidebar sr_rad_levels
scoreboard objectives setdisplay list sr_is_radiated