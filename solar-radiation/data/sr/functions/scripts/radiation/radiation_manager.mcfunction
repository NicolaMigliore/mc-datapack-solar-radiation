# Manage radiation levels
execute as @a[tag=sr_is_radiated] run function sr:scripts/radiation/rad_increase
execute as @a[tag=!sr_is_radiated] run function sr:scripts/radiation/rad_decrease
# execute as @a[tag=sr_is_radiated] if score @s sr_rad_levels < $_sr_max_rad_level sr_int run scoreboard players add @s sr_rad_levels 1
# execute as @a[tag=!sr_is_radiated] if score @s sr_rad_levels matches 1.. run scoreboard players remove @s sr_rad_levels 1

# Show or hide radbar
execute as @a[scores={sr_rad_levels=1..}] run function sr:scripts/radbar/show
execute as @a[scores={sr_rad_levels=..0}] run function sr:scripts/radbar/hide

# Remove tags
tag @a[scores={sr_rad_levels=10..}] remove sr_rad_level_0
tag @a[scores={sr_rad_levels=..9}] remove sr_rad_level_1
tag @a[scores={sr_rad_levels=30..}] remove sr_rad_level_1
tag @a[scores={sr_rad_levels=..29}] remove sr_rad_level_2
tag @a[scores={sr_rad_levels=60..}] remove sr_rad_level_2
tag @a[scores={sr_rad_levels=..59}] remove sr_rad_level_3
tag @a[scores={sr_rad_levels=90..}] remove sr_rad_level_3
tag @a[scores={sr_rad_levels=..89}] remove sr_rad_level_4
tag @a[scores={sr_rad_levels=120..}] remove sr_rad_level_4
tag @a[scores={sr_rad_levels=..119}] remove sr_rad_level_5
tag @a[scores={sr_rad_levels=180..}] remove sr_rad_level_5
tag @a[scores={sr_rad_levels=..179}] remove sr_rad_level_6
# Add tags
tag @a[scores={sr_rad_levels=..9}] add sr_rad_level_0
tag @a[scores={sr_rad_levels=10..29}] add sr_rad_level_1
tag @a[scores={sr_rad_levels=30..59}] add sr_rad_level_2
tag @a[scores={sr_rad_levels=60..89}] add sr_rad_level_3
tag @a[scores={sr_rad_levels=90..119}] add sr_rad_level_4
tag @a[scores={sr_rad_levels=120..179}] add sr_rad_level_5
tag @a[scores={sr_rad_levels=180..}] add sr_rad_level_6

# Add effects
execute as @a[tag=sr_rad_level_1] run function sr:scripts/radiation/set_rad_level_1
execute as @a[tag=sr_rad_level_2] run function sr:scripts/radiation/set_rad_level_2
execute as @a[tag=sr_rad_level_3] run function sr:scripts/radiation/set_rad_level_3
execute as @a[tag=sr_rad_level_4] run function sr:scripts/radiation/set_rad_level_4
execute as @a[tag=sr_rad_level_5] run function sr:scripts/radiation/set_rad_level_5
execute as @a[tag=sr_rad_level_6] run function sr:scripts/radiation/set_rad_level_6

# execute as @a[scores={sr_rad_levels=10..29}] run function sr:scripts/radiation/set_rad_level_1
# execute as @a[scores={sr_rad_levels=30..59}] run function sr:scripts/radiation/set_rad_level_2
# execute as @a[scores={sr_rad_levels=60..89}] run function sr:scripts/radiation/set_rad_level_3
# execute as @a[scores={sr_rad_levels=90..119}] run function sr:scripts/radiation/set_rad_level_4
# execute as @a[scores={sr_rad_levels=120..179}] run function sr:scripts/radiation/set_rad_level_5
# execute as @a[scores={sr_rad_levels=180..}] run function sr:scripts/radiation/set_rad_level_6
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_1 sr_int run function sr:scripts/radiation/set_rad_level_1
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_2 sr_int run function sr:scripts/radiation/set_rad_level_2
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_3 sr_int run function sr:scripts/radiation/set_rad_level_3
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_4 sr_int run function sr:scripts/radiation/set_rad_level_4
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_5 sr_int run function sr:scripts/radiation/set_rad_level_5
# # execute as @s if score @s sr_rad_levels >= $_sr_rad_level_6 sr_int run function sr:scripts/radiation/set_rad_level_6
