scoreboard players add .sr_user_id bossbar 1
execute if score .sr_user_id bossbar > $_sr_max_player_count sr_int run scoreboard players set .sr_user_id bossbar 1

scoreboard players set .sr_found_user bossbar 0
execute as @a if score @s bossbar = .sr_user_id bossbar run scoreboard players set .sr_found_user bossbar 1

execute if score .sr_found_user bossbar matches 0 run function sr:scripts/radbar/assign_id1
execute if score .sr_found_user bossbar matches 1 run function sr:scripts/radbar/assign_id