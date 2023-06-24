say DEBUG: Remove copper
execute store result score Copper sr_item_stacks run data get entity @s Item.Count
scoreboard players remove Copper sr_item_stacks 1
execute as @s run execute store result entity @s Item.Count int 1 run scoreboard players get Copper sr_item_stacks