# Sounds for active kit
execute if score $_sr_animation_frame sr_int matches 5 at @e[type=interaction,tag=decont_kit_interaction,scores={sr_decont_kit_lvl=1..,sr_decont_has_powder=1}] run playsound minecraft:block.lava.ambient neutral @a ~ ~ ~ 0.5 2


