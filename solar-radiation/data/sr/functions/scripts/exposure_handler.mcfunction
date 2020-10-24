#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Check if players are exposed to radiation                   #
#       and update scoreboard.                                      #
#                                                                   #
#####################################################################

# Raycast
scoreboard players reset @a sr_raycast 
execute as @a at @s store result score @s sr_raycast run data get entity @s Pos[1] 1

execute as @a at @s positioned ~ ~1 ~ run function sr:scripts/raycast

schedule function sr:scripts/exposure_handler 1s