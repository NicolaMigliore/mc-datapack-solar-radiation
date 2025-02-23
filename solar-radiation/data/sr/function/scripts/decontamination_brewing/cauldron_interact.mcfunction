# Tag the current interacting player
tag @s add sr_brewing_decont

# Check if decontamination kit can brew
scoreboard players set $_sr_kit_can_brew sr_boolean 0


# Find the correct decontamination kit
execute as @e[type=interaction,tag=decont_kit_interaction,distance=..6] run function sr:scripts/decontamination_brewing/find_interacted_cauldron


# Give player the potion
execute as @s if score $_sr_kit_can_brew sr_boolean matches 1 run function sr:scripts/custom_craft/decontamination_potion/give_decont_potion

advancement revoke @s only sr:solar_radiation/cauldron_interaction/brew_decont_potion
tag @s remove sr_brewing_decont
