#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Script triggers itself and checks                           #
#       the block above the triggering position,                    #
#       effectively checking one block higher every "loop".         #
#                                                                   #
#####################################################################
# say "DEBUG: Called raycast"
# NOTE: Scoreboard "sr_raycast" defines the block height that is being checked.

# Increment the block height to check by 1,
scoreboard players add @s sr_raycast 1

# If the block above is "all_but_air" increment sr_cur_cover_thickness
scoreboard players set @s sr_found_cover 0

# Exclude transparent blocs
execute as @s unless block ~ ~1 ~ minecraft:air unless block ~ ~1 ~ #minecraft:leaves unless block ~ ~1 ~ #minecraft:impermeable run scoreboard players set @s sr_found_cover 1
#run scoreboard players set $found_block sr_boolean 1
# Include Tinted Glass
execute as @s if block ~ ~1 ~ minecraft:tinted_glass run scoreboard players set @s sr_found_cover 1

execute as @s if score @s sr_found_cover matches 1 run scoreboard players add @s sr_cur_cover_thickness 1
# execute as @s if block  ~1 ~ #sr:all_but_air say "valid Block found"

# If raycast has not reached the top level (320) and shelter value is not valid --> run script again.
execute positioned ~ ~1 ~ unless score @s sr_cur_cover_thickness >= $_min_shelter sr_int unless score @s sr_raycast matches 320.. run function sr:scripts/raycast
