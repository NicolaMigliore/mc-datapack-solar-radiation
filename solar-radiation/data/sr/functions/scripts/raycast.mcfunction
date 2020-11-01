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

# If the block above is "all_but_air" increment sr_cur_shelter
execute as @s if block ~ ~1 ~ #sr:all_but_air run scoreboard players add @s sr_cur_shelter 1

# If raycast has not reached the top level (254) and shelter value is not valid --> run script again.
execute positioned ~ ~1 ~ unless score @s sr_cur_shelter >= $_min_shelter sr_int unless score @s sr_raycast matches 254.. run function sr:scripts/raycast
