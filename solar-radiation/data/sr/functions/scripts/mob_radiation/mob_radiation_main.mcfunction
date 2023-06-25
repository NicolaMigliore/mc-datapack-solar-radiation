# say MOB SPREAD
# Spread radiation from players to entities
execute as @a[scores={sr_rad_levels=5..}] at @s as @e[type=minecraft:cow,tag=!sr_is_radiated,distance=0..5] run tag @s add sr_is_radiated
execute as @a[scores={sr_rad_levels=5..}] at @s as @e[type=minecraft:sheep,tag=!sr_is_radiated,distance=0..5] run tag @s add sr_is_radiated

# Add radiation effects all radiated entities
execute as @e[type=!minecraft:player,tag=sr_is_radiated] run data merge entity @s {Fire:100}
effect give @e[type=!minecraft:player,tag=sr_is_radiated] minecraft:glowing infinite

# Spread radiation between entities
execute as @e[type=!minecraft:player,tag=sr_is_radiated] at @s as @e[type=!minecraft:player,tag=!sr_is_radiated,distance=0..2] run tag @s add sr_is_radiated