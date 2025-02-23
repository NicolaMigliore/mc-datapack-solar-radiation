execute store result score craftingCampfire sr_item_stacks run data get entity @s Item.Count
scoreboard players remove craftingCampfire sr_item_stacks 1
execute as @s run execute store result entity @s Item.Count int 1 run scoreboard players get craftingCampfire sr_item_stacks