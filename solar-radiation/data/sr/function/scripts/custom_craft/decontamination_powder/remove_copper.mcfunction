execute store result score Copper sr_item_stacks run data get entity @s Item.count
scoreboard players remove Copper sr_item_stacks 1
execute as @s run execute store result entity @s Item.count int 1 run scoreboard players get Copper sr_item_stacks