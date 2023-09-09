
execute if score @s sr_rad_levels matches 1.. run advancement grant @s only sr:solar_radiation/cure/got_rads
execute if score @s sr_rad_levels matches 1.. run scoreboard players remove @s sr_rad_levels 60
execute if score @s sr_rad_levels matches ..60 run scoreboard players set @s sr_rad_levels 0
advancement revoke @s only sr:solar_radiation/drink_milk_check

# Use scoreboard based on "minecraft.used:minecraft.milk_bucket" to check if player has drinken milk ad trigger advancement.
