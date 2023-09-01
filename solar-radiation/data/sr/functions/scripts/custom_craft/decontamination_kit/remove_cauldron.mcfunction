execute store result score craftingCauldron sr_item_stacks run data get entity @s Item.Count
scoreboard players remove craftingCauldron sr_item_stacks 1
execute as @s run execute store result entity @s Item.Count int 1 run scoreboard players get craftingCauldron sr_item_stacks