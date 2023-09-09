#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Function called on reload of pack.                          #
#                                                                   #
#####################################################################

# Init message
tellraw @a [{"text":"Solar Radiation Datapack reloading...", "color":"#77AAAA"}]

# function sr:uninstall
# # function sr:init
# schedule function sr:init 1s

scoreboard objectives add sr_boolean dummy
execute unless score $sr_installed sr_boolean matches 1 run function sr:uninstall
execute unless score $sr_installed sr_boolean matches 1 run function sr:install

# Stop loop
schedule clear sr:main_loop
schedule function sr:init 1s