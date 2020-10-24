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

# sr_boolean is a scoreboard that will be used to store boolean vars.
scoreboard objectives add sr_boolean dummy

# Initialize datapack
execute unless score $init sr_boolean matches 1 run function sr:scripts/init