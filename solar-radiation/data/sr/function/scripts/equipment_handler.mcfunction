#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Check if player is wearing full hazmat suit.                #
#                                                                   #
#       NOTE: For the moment the hazmat suit will be                #
#           a full chainmale armour set with special nbt.            #
#                                                                   #
#####################################################################

# Assume the player has full armour
tag @s add sr_has_equipment

scoreboard players set @s sr_damage_equipment 0
# Player is assumed to be out of cover or the function would not be called
execute if score $is_day sr_boolean matches 1 run scoreboard players set @s sr_damage_equipment 1

# Check if player is missing a piece of hazmat suit (for the moment chainmale)
# 1) Check head
execute unless data entity @s equipment.head.components."minecraft:custom_data"."sr:hazmat_helmet" run tag @s remove sr_has_equipment
execute if data entity @s equipment.head.components."minecraft:custom_data"."sr:hazmat_helmet" run item modify entity @s armor.head sr:damage_hazmat_helmet

# 2) Check chest
execute unless data entity @s equipment.chest.components."minecraft:custom_data"."sr:hazmat_chestplate" run tag @s remove sr_has_equipment
execute if data entity @s equipment.chest.components."minecraft:custom_data"."sr:hazmat_chestplate" run item modify entity @s armor.chest sr:damage_hazmat_chestplate

# 3) Check legs
execute unless data entity @s equipment.legs.components."minecraft:custom_data"."sr:hazmat_leggings" run tag @s remove sr_has_equipment
execute if data entity @s equipment.legs.components."minecraft:custom_data"."sr:hazmat_leggings" run item modify entity @s armor.legs sr:damage_hazmat_leggings

# 4) Check boots
execute unless data entity @s equipment.feet.components."minecraft:custom_data"."sr:hazmat_boots" run tag @s remove sr_has_equipment
execute if data entity @s equipment.feet.components."minecraft:custom_data"."sr:hazmat_boots" run item modify entity @s armor.feet sr:damage_hazmat_boots
