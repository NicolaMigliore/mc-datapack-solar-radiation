execute store result score SpiderEye sr_item_stacks run data get entity @s Item.count
scoreboard players remove SpiderEye sr_item_stacks 1
execute as @s run execute store result entity @s Item.count int 1 run scoreboard players get SpiderEye sr_item_stacks