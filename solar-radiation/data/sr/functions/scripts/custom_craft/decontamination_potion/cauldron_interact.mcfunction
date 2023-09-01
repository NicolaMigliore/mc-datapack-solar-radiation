advancement revoke @s only sr:solar_radiation/cauldron_interaction/right_click
say Interacted with cauldron
function sr:scripts/custom_craft/decontamination_potion/remove_bottle
function sr:scripts/custom_craft/decontamination_potion/give_decont_potion

# Tag the current interacting player
tag @s add sr_brewing_decont
# Give player the potion
execute as @s run function sr:scripts/custom_craft/decontamination_potion/give_decont_potion
# Reduce cauldron level
execute as @e[type=interaction,tag=decont_kit_interaction,distance=..6] run function sr:scripts/custom_craft/decontamination_potion/finde_interacted_cauldron
tag @s remove sr_brewing_decont