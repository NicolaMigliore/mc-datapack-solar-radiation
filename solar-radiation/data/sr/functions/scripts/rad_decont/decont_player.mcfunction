say Decontaminating Player
effect clear @s minecraft:luck
effect clear @s minecraft:glowing
scoreboard players set @s sr_rad_levels 0
tag @s remove sr_is_radiated
advancement revoke @s only sr:solar_radiation/test_cure