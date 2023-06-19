#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Install required scoreboards.                               #
#                                                                   #
#####################################################################

# Int values
scoreboard objectives add sr_int dummy
# sr_boolean is a scoreboard that will be used to store boolean vars.
scoreboard objectives add sr_boolean dummy

# Radiation levels of players
scoreboard objectives add sr_is_radiated dummy
scoreboard objectives add sr_rad_levels dummy

# Raycast
scoreboard objectives add sr_raycast dummy
scoreboard objectives add sr_found_cover dummy

# Equipment management
scoreboard objectives add sr_has_equipment dummy
scoreboard objectives add sr_damage_equipment dummy
scoreboard objectives add sr_damage_levels dummy

# Current shelter thickness
scoreboard objectives add sr_cur_cover_thickness dummy




# Set Constants
scoreboard players set $_end_of_day sr_int 12000
scoreboard players set $_sr_world_height sr_int 320
scoreboard players set $_min_shelter sr_int 3
scoreboard players set $_sr_rad_level_1 sr_int 10
scoreboard players set $_sr_rad_level_2 sr_int 30
scoreboard players set $_sr_rad_level_3 sr_int 60
scoreboard players set $_sr_rad_level_4 sr_int 90
scoreboard players set $_sr_rad_level_5 sr_int 120
scoreboard players set $_sr_rad_level_6 sr_int 1800
scoreboard players set $_sr_max_rad_level sr_int 180
scoreboard players set $_sr_max_player_count sr_int 4

tellraw @a [{"text":"Solar Radiation Datapack installed.","color":"yellow"}]
