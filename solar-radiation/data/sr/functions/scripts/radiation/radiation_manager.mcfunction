# Update radiation levels
scoreboard players set @a sr_is_radiated 0
execute as @a if score @s sr_raycast = $_sr_world_height sr_int if score @s sr_has_equipment matches 0 if score $is_day sr_boolean matches 1 run scoreboard players set @s sr_is_radiated 1

# Manage radiation levels
execute as @a if score @s sr_is_radiated matches 1 if score @s sr_rad_levels < $_sr_max_rad_level sr_int run scoreboard players add @s sr_rad_levels 1
execute as @a if score @s sr_is_radiated matches 0 if score @s sr_rad_levels matches 1.. run scoreboard players remove @s sr_rad_levels 1

# Show or hide radbar
execute as @a if score @s sr_rad_levels matches 1.. run function sr:scripts/radbar/show
execute as @a if score @s sr_rad_levels matches ..0 run function sr:scripts/radbar/hide


# Add effects
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_1 sr_int run function sr:scripts/radiation/set_rad_level_1
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_2 sr_int run function sr:scripts/radiation/set_rad_level_2
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_3 sr_int run function sr:scripts/radiation/set_rad_level_3
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run function sr:scripts/radiation/set_rad_level_4
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_5 sr_int run function sr:scripts/radiation/set_rad_level_5
execute as @a if score @s sr_rad_levels >= $_sr_rad_level_6 sr_int run function sr:scripts/radiation/set_rad_level_6