execute as @s store result score @s sr_gather_oak_log run clear @s minecraft:oak_log 0

# If matchet target then award advancement
execute if score @s sr_gather_oak_log matches 320.. run advancement grant @s only sr:solar_radiation/gather/gather_oak

# else revoke
execute if score @s sr_gather_oak_log matches ..319 run advancement revoke @s only sr:solar_radiation/gather/gather_oak_check