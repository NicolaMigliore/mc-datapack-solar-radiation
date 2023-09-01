# Clear contamination for mobs that gain the luck effect
execute as @e[type=#sr:radiation_vulnerable,predicate=sr:effect/luck] run function sr:scripts/rad_decont/decont_mob

# Run custom recipe check
function sr:scripts/custom_craft/decontamination_powder/craft_item
function sr:scripts/custom_craft/decontamination_kit/craft_item