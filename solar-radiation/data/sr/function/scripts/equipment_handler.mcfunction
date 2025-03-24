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
#           a fullchainmale armour set with special nbt.            #
#                                                                   #
#####################################################################

# Assume the player has full armour
tag @s add sr_has_equipment

scoreboard players set @s sr_damage_equipment 0
# Player is assumed to be out of cover or the function would not be called
execute if score $is_day sr_boolean matches 1 run scoreboard players set @s sr_damage_equipment 1
# execute if score @s sr_found_cover matches 0 if score $is_day sr_boolean matches 1 run scoreboard players set @s sr_damage_equipment 1

# Check if player is missing a piece of hazmat suit (for the moment chainmale)
# 1) Check head (slot:103b)
#execute unless entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", tag:{display:{Name:'[{"text":"Hazmat Helmet","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", components:{"minecraft:item_model":"sr:hazmat_helmet"}}]}] run tag @s remove sr_has_equipment
execute if entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", components:{"minecraft:item_model":"sr:hazmat_helmet"}}]}] if score @s sr_damage_equipment matches 1 store result score Damage sr_damage_levels run data get entity @s Inventory[{Slot:103b}].tag.Damage
execute if entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", components:{"minecraft:item_model":"sr:hazmat_helmet"}}]}] if score @s sr_damage_equipment matches 1 store result storage sr:data Damage int 1 run scoreboard players add Damage sr_damage_levels 1
execute if entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", components:{"minecraft:item_model":"sr:hazmat_helmet"}}]}] if score @s sr_damage_equipment matches 1 run item modify entity @s armor.head sr:damage_hazmat_helmet


# 2) Check chest (slot:102b)
#execute unless entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", tag:{display:{Name:'[{"text":"Hazmat Chestplate","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", components:{"minecraft:item_model":"sr:hazmat_chestplate"}}]}] run tag @s remove sr_has_equipment
execute if entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", components:{"minecraft:item_model":"sr:hazmat_chestplate"}}]}] if score @s sr_damage_equipment matches 1 store result score Damage sr_damage_levels run data get entity @s Inventory[{Slot:102b}].tag.Damage
execute if entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", components:{"minecraft:item_model":"sr:hazmat_chestplate"}}]}] if score @s sr_damage_equipment matches 1 store result storage sr:data Damage int 1 run scoreboard players add Damage sr_damage_levels 1
execute if entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", components:{"minecraft:item_model":"sr:hazmat_chestplate"}}]}] if score @s sr_damage_equipment matches 1 run item modify entity @s armor.chest sr:damage_hazmat_chestplate


# 3) Check legs (slot:101b)
#execute unless entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", tag:{display:{Name:'[{"text":"Hazmat Leggings","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", components:{"minecraft:item_model":"sr:hazmat_leggings"}}]}] run tag @s remove sr_has_equipment
execute if entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", components:{"minecraft:item_model":"sr:hazmat_leggings"}}]}] if score @s sr_damage_equipment matches 1 store result score Damage sr_damage_levels run data get entity @s Inventory[{Slot:101b}].tag.Damage
execute if entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", components:{"minecraft:item_model":"sr:hazmat_leggings"}}]}] if score @s sr_damage_equipment matches 1 store result storage sr:data Damage int 1 run scoreboard players add Damage sr_damage_levels 1
execute if entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", components:{"minecraft:item_model":"sr:hazmat_leggings"}}]}] if score @s sr_damage_equipment matches 1 run item modify entity @s armor.legs sr:damage_hazmat_leggings


# 4) Check boots (slot:10ob)
#execute unless entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", tag:{display:{Name:'[{"text":"Hazmat Boots","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", components:{"minecraft:item_model":"sr:hazmat_boots"}}]}] run tag @s remove sr_has_equipment
execute if entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", components:{"minecraft:item_model":"sr:hazmat_boots"}}]}] if score @s sr_damage_equipment matches 1 store result score Damage sr_damage_levels run data get entity @s Inventory[{Slot:100b}].tag.Damage
execute if entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", components:{"minecraft:item_model":"sr:hazmat_boots"}}]}] if score @s sr_damage_equipment matches 1 store result storage sr:data Damage int 1 run scoreboard players add Damage sr_damage_levels 1
execute if entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", components:{"minecraft:item_model":"sr:hazmat_boots"}}]}] if score @s sr_damage_equipment matches 1 run item modify entity @s armor.feet sr:damage_hazmat_boots
