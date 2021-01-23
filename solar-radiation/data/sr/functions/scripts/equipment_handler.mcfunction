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
scoreboard players set @s sr_has_equipment 1

# Check if player is missing a piece of hazmat suit (for the moment chainmale)

# 1) Check head (slot:103b)
#execute unless entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", tag:{display:{Name:'[{"text":"Hazmat Helmet","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet"}]}] run scoreboard players set @s sr_has_equipment 0

# 2) Check chest (slot:102b)
#execute unless entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", tag:{display:{Name:'[{"text":"Hazmat Chestplate","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate"}]}] run scoreboard players set @s sr_has_equipment 0


# 3) Check legs (slot:101b)
#execute unless entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", tag:{display:{Name:'[{"text":"Hazmat Leggings","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings"}]}] run scoreboard players set @s sr_has_equipment 0

# 4) Check boots (slot:10ob)
#execute unless entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", tag:{display:{Name:'[{"text":"Hazmat Boots","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
execute unless entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots"}]}] run scoreboard players set @s sr_has_equipment 0
