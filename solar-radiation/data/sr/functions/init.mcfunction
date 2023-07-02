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


# Init message
tellraw @a [{"text":"Solar Radiation Datapack initialized.", "color":"#77AAAA"}]

# Initialize = true
scoreboard players set $init sr_boolean 1

# Give intro book to players
execute as @a run function sr:scripts/give_intro_book
# Set player rad level
scoreboard players set @a sr_rad_levels 0

# Set scene
time set 12001
effect clear @a

# Init Radbar
function sr:scripts/radbar/radbar_init

# Init Decontamination cauldron
function srfc:init

# Init Day count
function sr:scripts/day_management/day_management_init 

# Schedule main loop
schedule function sr:main_loop 1s

# FOR DEBUG
scoreboard objectives setdisplay sidebar sr_days_survived