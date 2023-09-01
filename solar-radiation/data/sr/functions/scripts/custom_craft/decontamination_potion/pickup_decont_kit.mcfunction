# Render particles
particle angry_villager ~ ~1.5 ~ 0 0 0 0 1

# Kill entities
execute at @s align xyz run kill @e[tag=decont_kit_render_item,distance=..0.5]
execute at @s align xyz run kill @e[tag=decont_kit_interaction,distance=..0.5]
execute at @s run kill @e[tag=decont_kit_frame,distance=..0.1]
execute at @s run kill @e[type=minecraft:block_display,nbt={block_state:{Name:"minecraft:air"}},distance=..1]
kill @s

# Drop item
loot spawn ~ ~ ~ loot sr:decont_kit