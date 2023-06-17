#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Set player radiation effects for rad level 3.               #
#                                                                   #
#####################################################################

execute as @s unless score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run effect give @s minecraft:poison 5
effect give @s minecraft:glowing 30