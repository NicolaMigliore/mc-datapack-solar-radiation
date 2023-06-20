# Manage radiation levels
execute as @s[tag=sr_is_radiated] if score @s sr_rad_levels < $_sr_max_rad_level sr_int run scoreboard players add @s sr_rad_levels 1
execute as @s[tag=!sr_is_radiated] if score @s sr_rad_levels matches 1.. run scoreboard players remove @s sr_rad_levels 1

# Show or hide radbar
execute as @s if score @s sr_rad_levels matches 1.. run function sr:scripts/radbar/show
execute as @s if score @s sr_rad_levels matches ..0 run function sr:scripts/radbar/hide


# Add effects
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_1 sr_int run function sr:scripts/radiation/set_rad_level_1
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_2 sr_int run function sr:scripts/radiation/set_rad_level_2
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_3 sr_int run function sr:scripts/radiation/set_rad_level_3
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run function sr:scripts/radiation/set_rad_level_4
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_5 sr_int run function sr:scripts/radiation/set_rad_level_5
execute as @s if score @s sr_rad_levels >= $_sr_rad_level_6 sr_int run function sr:scripts/radiation/set_rad_level_6