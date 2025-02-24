# Check for items in cauldron
execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}}] at @s run execute as @e[type=item, nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] at @s if block ~ ~ ~ minecraft:water_cauldron run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:poisonous_potato",count:1b,components:{item_model:"sr:decontamination_powder",custom_model_data:{floats:[1918001]},custom_name:'[{"text":"Decontamination Powder","italic":false,"color":"aqua"}]',lore:['[{"text":"Useful to reduce","italic":false,"color":"dark_purple"},{"text":"the effects of radiations","italic":false,"color":"dark_purple"}]']}},Tags:["fresh_craft","decont_powder"]}

execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:raw_copper"}},limit=1,sort=nearest] run function sr:scripts/custom_craft/decontamination_powder/remove_copper
execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:spider_eye"}},limit=1,sort=nearest,distance=0..1] run function sr:scripts/custom_craft/decontamination_powder/remove_spider_eye

execute at @e[tag=fresh_craft] run function sr:scripts/custom_craft/decontamination_powder/craft_animation

execute as @e[tag=fresh_craft] run tag @s remove fresh_craft
