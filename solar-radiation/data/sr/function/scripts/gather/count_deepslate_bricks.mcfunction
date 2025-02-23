execute as @s store result score @s sr_gather_deepslate_bricks run clear @s minecraft:deepslate_bricks 0

# If matchet target then award advancement
execute if score @s sr_gather_deepslate_bricks matches 320.. run advancement grant @s only sr:solar_radiation/gather/gather_deepslate_bricks

# else revoke
execute if score @s sr_gather_deepslate_bricks matches ..319 run advancement revoke @s only sr:solar_radiation/gather/gather_deepslate_bricks_check