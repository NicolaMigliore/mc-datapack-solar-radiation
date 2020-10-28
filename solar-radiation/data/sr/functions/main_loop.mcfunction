#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Main loop function gets called every game tick.             #
#                                                                   #
#####################################################################

# sr_boolean is a scoreboard that will be used to store boolean vars.
scoreboard objectives add sr_boolean dummy

# Initialize datapack
execute unless score $init sr_boolean matches 1 run function sr:init

# Check for players equipment
execute as @a run function sr:scripts/equipment_handler

# Check for time of day

# Apply effect if player is exposed and has no equipment
# execute as @a if score @s sr_raycast matches 254 if score @s sr_has_equipment matches 0 if score $is_day sr_boolean matches 1 run effect give @s poison 5 1
  execute as @a if score @s sr_raycast matches 254 if score @s sr_has_equipment matches 0 run effect give @s poison 5 1
