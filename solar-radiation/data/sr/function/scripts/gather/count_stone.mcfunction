execute as @s store result score @s sr_gather_cobblestone run clear @s minecraft:cobblestone 0

# If matchet target then award advancement
execute if score @s sr_gather_cobblestone matches 640.. run advancement grant @s only sr:solar_radiation/gather/gather_cobblestone

# else revoke
execute if score @s sr_gather_cobblestone matches ..639 run advancement revoke @s only sr:solar_radiation/gather/gather_cobblestone_check