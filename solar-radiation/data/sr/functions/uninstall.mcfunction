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

scoreboard objectives remove sr_boolean
scoreboard objectives remove sr_int
scoreboard objectives remove sr_is_radiated
scoreboard objectives remove sr_raycast
scoreboard objectives remove sr_has_equipment

tellraw @a [{"text":"Solar Radiation Datapack uninstalled. \nUse /datapack enable \"file/sr \" to reinstall","color":"yellow"}]

datapack disable "file/sr"