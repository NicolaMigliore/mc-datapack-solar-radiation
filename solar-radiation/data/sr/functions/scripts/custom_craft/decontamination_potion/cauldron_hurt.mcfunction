advancement revoke @s only sr:solar_radiation/cauldron_interaction/left_click
say braking decontamination kit

tag @s add sr_is_breaking_decont_kit
execute as @e[type=interaction,tag=decont_kit_interaction,distance=..6] run function sr:scripts/custom_craft/decontamination_potion/find_hurt_cauldron
tag @s remove sr_is_breaking_decont_kit