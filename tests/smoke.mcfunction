# Executed only in the disposable GameTest world by scripts/validate.py.
scoreboard objectives add sr_test dummy
execute unless score $sr_installed sr_boolean matches 1 run say SR_VALIDATION_FAIL: installation
execute unless score $init sr_boolean matches 1 run say SR_VALIDATION_FAIL: initialization

# The new world-clock query must preserve the original day/night thresholds.
time of minecraft:overworld set 6000
function sr:scripts/day_management/daytime_main
execute unless score $daytime sr_int matches 6000 run say SR_VALIDATION_FAIL: daytime query
execute unless score $is_day sr_boolean matches 1 run say SR_VALIDATION_FAIL: daylight
time of minecraft:overworld set 18000
function sr:scripts/day_management/daytime_main
execute unless score $is_day sr_boolean matches 0 run say SR_VALIDATION_FAIL: night

# Generate every loot table, including their text and item components.
setblock 0 100 0 minecraft:barrel
loot replace block 0 100 0 container.0 loot sr:books/intro_book
execute unless items block 0 100 0 container.0 minecraft:written_book[minecraft:item_model="sr:sr_book"] run say SR_VALIDATION_FAIL: intro book
loot replace block 0 100 0 container.0 loot sr:books/decont_for_dummies
execute unless items block 0 100 0 container.0 minecraft:written_book[minecraft:item_model="sr:sr_book"] run say SR_VALIDATION_FAIL: brewing book
loot replace block 0 100 0 container.0 loot sr:decont_kit
execute unless items block 0 100 0 container.0 minecraft:item_frame[minecraft:item_model="sr:decontamination_kit"] run say SR_VALIDATION_FAIL: decontamination kit
loot replace block 0 100 0 container.0 loot sr:decont_potion
execute unless items block 0 100 0 container.0 minecraft:splash_potion[minecraft:potion_contents={custom_color:760906,custom_effects:[{id:"minecraft:luck",amplifier:0,duration:40}]}] run say SR_VALIDATION_FAIL: decontamination potion
loot replace block 0 100 0 container.0 loot sr:glass_bottle
execute unless items block 0 100 0 container.0 minecraft:glass_bottle run say SR_VALIDATION_FAIL: glass bottle
loot replace block 0 100 0 container.0 loot sr:custom_armor/hazmat_helmet
execute unless items block 0 100 0 container.0 minecraft:chainmail_helmet run say SR_VALIDATION_FAIL: helmet loot

# A living entity supplies the same item-modifier context as a player.
summon minecraft:armor_stand 0 100 2 {Tags:["sr_validation"],NoGravity:1b}
item replace entity @e[tag=sr_validation,limit=1] weapon.mainhand with minecraft:glass_bottle 2
execute as @e[tag=sr_validation,limit=1] run item modify entity @s weapon.mainhand sr:reduce_stack_count
execute unless items entity @e[tag=sr_validation,limit=1] weapon.mainhand minecraft:glass_bottle[count=1] run say SR_VALIDATION_FAIL: ingredient consumption

# Test both durability loss and breaking for all four hazmat pieces.
function sr_validation:armor

# The luck predicate must match only entities that have the curing effect.
execute as @e[tag=sr_validation,limit=1] if predicate sr:effect/luck run say SR_VALIDATION_FAIL: luck false positive
effect give @e[tag=sr_validation,limit=1] minecraft:luck 10 0
execute as @e[tag=sr_validation,limit=1] unless predicate sr:effect/luck run say SR_VALIDATION_FAIL: luck predicate

# Test all four kit render states, including the renamed iron-chain block.
function sr_validation:render

