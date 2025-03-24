# Spread radiation from players to entities
execute as @a[scores={sr_rad_levels=5..}] at @s as @e[type=#sr:radiation_vulnerable,tag=!sr_is_radiated,distance=0..5] run function sr:scripts/rad_transfer/rad_spread

# Increase rad levels for exposed entities
execute as @a[scores={sr_rad_levels=5..}] at @s as @e[type=#sr:radiation_vulnerable,tag=sr_is_radiated,distance=0..5] run scoreboard players add @s sr_rad_levels 2

# Reduce entity radiaiton level
execute as @e[type=#sr:radiation_vulnerable, tag=sr_is_radiated] run scoreboard players remove @s sr_rad_levels 1

# Clear radiation
execute as @e[type=#sr:radiation_vulnerable, tag=sr_is_radiated, scores={sr_rad_levels=..0}] run function sr:scripts/rad_transfer/rad_clear


# Add radiation effects to all radiated entities
execute as @e[type=#sr:radiation_vulnerable,tag=sr_is_radiated] run function sr:scripts/rad_transfer/rad_effects

# Spread radiation between entities
execute as @e[type=#sr:radiation_vulnerable,tag=sr_is_radiated] at @s as @e[type=#sr:radiation_vulnerable,tag=!sr_is_radiated,distance=0..2] run function sr:scripts/rad_transfer/rad_spread