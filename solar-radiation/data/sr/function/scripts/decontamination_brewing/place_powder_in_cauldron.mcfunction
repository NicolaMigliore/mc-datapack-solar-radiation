# Set variable to consume ingredient
scoreboard players set $_sr_take_powder sr_boolean 1

# Set powder in kit
scoreboard players set @s sr_decont_has_powder 1

# Play sound
playsound minecraft:block.amethyst_block.step neutral @a ~ ~ ~ 1 1.8
playsound minecraft:block.enchantment_table.use neutral @a ~ ~ ~ 1 1.5