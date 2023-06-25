# say DEBUG: decont main


# execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}}] at @s run execute as @e[type=item, nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] at @s if block ~ ~ ~ minecraft:water_cauldron run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:poisonous_potato",Tags:["fresh_craft"], Count:1b,tag:{CustomModelData:1918001,display:{Name:'[{"text":"Decontamination Powder","italic":false,"color":"aqua"}]',Lore:['[{"text":"Useful to make food good again","italic":false,"color":"dark_purple"}]']}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}}] at @s run execute as @e[type=item, nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] at @s if block ~ ~ ~ minecraft:water_cauldron run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:poisonous_potato",Count:1b,tag:{CustomModelData:1918001,display:{Name:'[{"text":"Decontamination Powder","italic":false,"color":"aqua"}]',Lore:['[{"text":"Useful to make food good again","italic":false,"color":"dark_purple"}]']}}},Tags:["fresh_craft"]}


# execute store result score Copper sr_item_stacks run data get entity @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}},sort=nearest,limit=1] Item.Count
# scoreboard players remove Copper sr_item_stacks 1
# execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}},sort=nearest,limit=1] run execute store result entity @s Item.Count int 1 run scoreboard players get Copper sr_item_stacks

execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}},limit=1,sort=nearest] run function sr:scripts/decontamination/remove_copper
# execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] run function sr:scripts/decontamination/remove_copper
execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] run function sr:scripts/decontamination/remove_spider_eye

# execute as @e[tag=fresh_craft] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}},sort=nearest,limit=1]
# execute as @e[tag=fresh_craft] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:spider_eye"}},sort=nearest,limit=1]
execute as @e[tag=fresh_craft] run tag @s remove fresh_craft

# # execute as @e[type=item,nbt={Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}] at @s run execute as @e[type=item, nbt={Item:{id:"minecraft:blaze_powder"}},limit=1,sort=nearest,distance=0..1] at @s if block ~ ~ ~ minecraft:water_cauldron run summon minecraft:item ~ ~2 ~ {Item:{id:"minecraft:poisonous_potato",Tags:["fresh_craft"], Count:1b,tag:{CustomModelData:1918001,display:{Name:'[{"text":"Decontamination Powder","italic":false,"color":"aqua"}]',Lore:['[{"text":"Useful to make food good again","italic":false,"color":"dark_purple"}]']}}}}

# # summon minecraft:item ~ ~2 ~ {Item:{id:"minecraft:poisonous_potato",Tags:["fresh_craft"], Count:1b,tag:{CustomModelData:1918001,display:{Name:'{"text":"Decontamination Powder","color":"gold"}'}}}}

# summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:poisonous_potato",Tags:["fresh_craft"], Count:1b,tag:{CustomModelData:1918001,display:{Name:'[{"text":"Decontamination Powder","italic":false,"color":"aqua"}]',}}}}


# summon item ~ ~ ~ {Item:{id:"minecraft:raw_copper",Count:1b}}
# summon item ~-3 ~ ~ {Item:{id:"minecraft:raw_copper",Count:1b},Tags:["fresh_craft"]}
# # Destroy ingredients


# # execute as @e[type=item,nbt={Item:{id:"minecraft:potion",tag:{Potion:"minecraft:water"}}}] at @s if block ~ ~ ~ minecraft:water_cauldron run scoreboard players set $found_bottle