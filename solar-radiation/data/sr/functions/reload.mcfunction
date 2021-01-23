#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Function called on reload of pack.                          #
#                                                                   #
#####################################################################

# Init message
tellraw @a [{"text":"Solar Radiation Datapack reloading...", "color":"#77AAAA"}]

# Give intro book to players
execute as @a run function sr:scripts/give_intro_book