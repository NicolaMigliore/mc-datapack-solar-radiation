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
# Reset player current shelter thickness
scoreboard players set @s sr_cur_cover_thickness 0

# Raycast
scoreboard players reset @s sr_raycast
execute at @s store result score @s sr_raycast run data get entity @s Pos[1] 1
execute at @s positioned ~ ~1 ~ run function sr:scripts/raycast

# If minimum cover thickess is matched, add tag
execute if score @s sr_cur_cover_thickness >= $_min_shelter sr_int run tag @s remove not_covered
execute if score @s sr_cur_cover_thickness < $_min_shelter sr_int run tag @s add not_covered