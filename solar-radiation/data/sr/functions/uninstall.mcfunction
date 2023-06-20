#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Uninstall required scoreboards.                             #
#                                                                   #
#####################################################################

scoreboard objectives remove sr_int
scoreboard objectives remove sr_boolean
scoreboard objectives remove sr_rad_levels
scoreboard objectives remove sr_raycast
scoreboard objectives remove sr_found_cover
scoreboard objectives remove sr_damage_equipment
scoreboard objectives remove sr_damage_levels
scoreboard objectives remove sr_cur_cover_thickness

tellraw @a [{"text":"Solar Radiation Datapack uninstalled. \nUse /datapack enable \"file/sr \" to reinstall","color":"yellow"}]

datapack disable "file/sr"