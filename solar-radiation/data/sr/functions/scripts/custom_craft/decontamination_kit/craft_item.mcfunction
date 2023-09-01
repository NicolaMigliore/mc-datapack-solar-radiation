
execute as @e[type=item,nbt={Item:{id:"minecraft:cauldron"}}] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:campfire"}},limit=1,sort=nearest,distance=0..1] at @s run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:1918010,display:{Name:'{"text":"Decontamination Kit","color":"aqua"}'},EntityTag:{Fixed:1b,Invisible:0b,Silent:1b,Tags:["decont_kit_frame"]}}},Tags:["fresh_craft"]}

execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:cauldron"}},limit=1,sort=nearest] run function sr:scripts/custom_craft/decontamination_kit/remove_cauldron
execute as @e[tag=fresh_craft] at @s run execute as @e[type=item,nbt={Item:{id:"minecraft:campfire"}},limit=1,sort=nearest] run function sr:scripts/custom_craft/decontamination_kit/remove_campfire

execute as @e[tag=fresh_craft] run tag @s remove fresh_craft