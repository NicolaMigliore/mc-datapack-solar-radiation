
#Give helmet
give @p chainmail_helmet{display:{Name:'[{"text":"Hazmat Helmet","color":"gold"}]',Lore:['{"text":"Part of the hazmat suit set.","color":"red"}','{"text":"If complete, the suit will protect from radiations.","color":"red"}']},CustomModelData:100103,hazmat_helmet:1b} 1

#Give chestplate
give @p chainmail_helmet{display:{Name:'{"text":"Hazmat Helmet","color":"gold"}',Lore:['{"text":"Part of the hazmat suit set.","color":"red"}','{"text":"If complete, the suit will protect from radiations.","color":"red"}']},CustomModelData:100102,hazmat_chestplate:1b} 1

#Give leggings
give @p chainmail_helmet{display:{Name:'{"text":"Hazmat Helmet","color":"gold"}',Lore:['{"text":"Part of the hazmat suit set.","color":"red"}','{"text":"If complete, the suit will protect from radiations.","color":"red"}']},CustomModelData:100101,hazmat_leggings:1b} 1

#Give boots
give @p chainmail_helmet{display:{Name:'{"text":"Hazmat Helmet","color":"gold"}',Lore:['{"text":"Part of the hazmat suit set.","color":"red"}','{"text":"If complete, the suit will protect from radiations.","color":"red"}']},CustomModelData:100100,hazmat_boots:1b} 1


# # # 1) Check head (slot:103b)
# # execute unless entity @s[nbt={Inventory:[{Slot:103b, id:"minecraft:chainmail_helmet", tag:{display:{Name:'[{"text":"Hazmat Helmet","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0

# # # 2) Check chest (slot:102b)
# # execute unless entity @s[nbt={Inventory:[{Slot:102b, id:"minecraft:chainmail_chestplate", tag:{display:{Name:'[{"text":"Hazmat Chestplate","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0

# # # 3) Check legs (slot:101b)
# # execute unless entity @s[nbt={Inventory:[{Slot:101b, id:"minecraft:chainmail_leggings", tag:{display:{Name:'[{"text":"Hazmat Leggings","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0

# # # 4) Check boots (slot:10ob)
# # execute unless entity @s[nbt={Inventory:[{Slot:100b, id:"minecraft:chainmail_boots", tag:{display:{Name:'[{"text":"Hazmat Boots","color":"gold"}]',Lore:['[{"text":"Part of the hazmat suit set.","color":"red"}]','[{"text":"If complete, the suit will protect from radiations.","color":"red"}]']}}}]}] run scoreboard players set @s sr_has_equipment 0
