#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Script triggers itself and checks                           #
#       the block above the triggering position,                    #
#       effectively checking one block higher every "loop".         #
#                                                                   #
#####################################################################

# NOTE: Scoreboard "sr_raycast" defines the block height that is being checked.

# Increment the block height to check by 1,
scoreboard players add @s sr_raycast 1

# If the block above the execution is not "all_but_air"
# And raycast has not reached the top level (254) --> run script again.
execute positioned ~ ~1 ~ unless block ~ ~ ~ #sr:all_but_air unless score @s sr_raycast matches 254.. run function sr:scripts/raycast