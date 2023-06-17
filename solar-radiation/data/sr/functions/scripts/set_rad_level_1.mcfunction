#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Set player radiation effects for rad level 1.               #
#                                                                   #
#####################################################################

execute as @s unless score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run effect give @s minecraft:mining_fatigue 30  
execute as @s unless score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run effect give @s minecraft:slowness 30