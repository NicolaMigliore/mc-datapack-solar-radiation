execute as @s store result score @s sr_gather_stone_bricks run clear @s minecraft:stone_bricks 0

# If matchet target then award advancement
execute if score @s sr_gather_stone_bricks matches 320.. run advancement grant @s only sr:solar_radiation/gather/gather_stone_bricks

# else revoke
execute if score @s sr_gather_stone_bricks matches ..319 run advancement revoke @s only sr:solar_radiation/gather/gather_stone_bricks_check