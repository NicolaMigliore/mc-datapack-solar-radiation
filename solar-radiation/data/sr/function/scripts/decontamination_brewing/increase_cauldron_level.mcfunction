# Set variable to consume ingredient
scoreboard players set $_sr_take_water sr_boolean 1

# Set scoreboard
scoreboard players set @s sr_decont_kit_lvl 3

# Play sound
playsound minecraft:entity.boat.paddle_water neutral @a ~ ~ ~ 8 2
playsound minecraft:block.enchantment_table.use neutral @a ~ ~ ~ 1 1.1

# Render cauldron
execute at @s align xyz run kill @e[tag=decont_kit_render_item,distance=..0.5]
execute at @s run kill @e[type=minecraft:block_display,nbt={block_state:{Name:"minecraft:air"}},distance=..1]

function sr:scripts/decontamination_brewing/render_decont_kit_3