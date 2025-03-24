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

# scoreboard objectives remove sr_boolean
scoreboard objectives remove sr_int
scoreboard objectives remove sr_rad_levels
scoreboard objectives remove sr_raycast
scoreboard objectives remove sr_found_cover
scoreboard objectives remove sr_damage_equipment
scoreboard objectives remove sr_damage_levels
scoreboard objectives remove sr_cur_cover_thickness
scoreboard objectives remove sr_item_stacks
scoreboard objectives remove sr_decont_kit_lvl
scoreboard objectives remove sr_decont_has_powder

tellraw @a [{"text":"Solar Radiation Datapack uninstalled.","color":"yellow"}]

# Stop loop
schedule clear sr:main_loop

# Uninstall Radbar
function sr:scripts/radbar/radbar_uninstall

# Uninstall Decontamination cauldron
function srfc:uninstall

# Uninstall Day count
function sr:scripts/day_management/day_management_uninstall

# Uninstall Gather count
function sr:scripts/gather/gather_uninstall


# Remove tags
tag @a remove sr_rad_level_0
tag @a remove sr_rad_level_1
tag @a remove sr_rad_level_2
tag @a remove sr_rad_level_3
tag @a remove sr_rad_level_4
tag @a remove sr_rad_level_5
tag @a remove sr_rad_level_6

datapack disable "file/sr"