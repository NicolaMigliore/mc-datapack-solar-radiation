# Animate kits with powder
execute if score $_sr_anim_frame_is_odd sr_boolean matches 0 at @e[tag=decont_kit_interaction,scores={sr_decont_has_powder=1}] run particle dust{color:[0.74,0.74,0.74], scale:1} 0.04 0.45 0.48 1 ~ ~0.5 0.1 15
execute if score $_sr_anim_frame_is_odd sr_boolean matches 1 at @e[tag=decont_kit_interaction,scores={sr_decont_has_powder=1}] run particle dust{color:[0.74,0.74,0.74], scale:1} 0.1 0.76 0.04 1 ~ ~0.45 0.1 15

# Animate kits that can brew
execute if score $_sr_anim_frame_is_odd sr_boolean matches 0 at @e[tag=decont_kit_interaction,scores={sr_decont_kit_lvl=1..,sr_decont_has_powder=1}] run particle minecraft:happy_villager ~ ~ ~ 0.2 0.5 0.2 1 3