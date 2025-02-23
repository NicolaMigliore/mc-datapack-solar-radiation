# # Display interaction
# particle happy_villager ~ ~0.5 ~ 0 0 0 0 1

# Lower cauldron level
scoreboard players remove @s sr_decont_kit_lvl 1
# Clear powder from kit
execute if score @s sr_decont_kit_lvl matches ..0 run scoreboard players set @s sr_decont_has_powder 0

# Play sounds
playsound minecraft:block.brewing_stand.brew neutral @a
# Particles
particle minecraft:effect ~ ~0.5 ~ 0 0.1 1 1 3

# Re-render decontamination kit
execute at @s run particle minecraft:cloud ~ ~0.5 ~
execute at @s run particle minecraft:cloud ~-0.2 ~0.5 ~
execute at @s run particle minecraft:cloud ~-0.2 ~0.5 ~0.1
execute at @s run particle minecraft:sculk_charge_pop ~0.1 ~0.7 ~
execute at @s run particle minecraft:enchanted_hit ~0.2 ~0.4 ~
execute at @s run particle minecraft:effect ~-0.2 ~0.6 ~
execute at @s align xyz run kill @e[tag=decont_kit_render_item,distance=..0.5]
execute if score @s sr_decont_kit_lvl matches 0 run function sr:scripts/decontamination_brewing/render_decont_kit_0
execute if score @s sr_decont_kit_lvl matches 1 run function sr:scripts/decontamination_brewing/render_decont_kit_1
execute if score @s sr_decont_kit_lvl matches 2 run function sr:scripts/decontamination_brewing/render_decont_kit_2