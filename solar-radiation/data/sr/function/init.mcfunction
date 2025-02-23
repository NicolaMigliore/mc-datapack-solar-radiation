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

# Init Radbar
function sr:scripts/radbar/radbar_init

# Init Decontamination cauldron
function srfc:init

# Init Day count
function sr:scripts/day_management/day_management_init 

# Init Gather count
function sr:scripts/gather/gather_init

# Schedule main loop
schedule function sr:main_loop 1s

# Scheduel animation loop
scoreboard players set $_sr_animation_frame sr_int 0
schedule function sr:scripts/animations/animation_main_loop 10t


# Initialize = true
scoreboard players set $init sr_boolean 1

# Init message
tellraw @a [{"text":"Solar Radiation Datapack initialized.\nTo restart datapack, run the comand \"/function sr:restart_datapack\"", "color":"#77AAAA"}]