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