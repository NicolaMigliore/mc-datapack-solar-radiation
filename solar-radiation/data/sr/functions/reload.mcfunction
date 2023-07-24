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
function sr:uninstall
# function sr:init
schedule function sr:init 3s
