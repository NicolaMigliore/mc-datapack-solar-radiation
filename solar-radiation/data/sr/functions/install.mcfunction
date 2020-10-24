#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Install required scoreboards.                               #
#                                                                   #
#####################################################################

# Int values
scoreboard objectives add sr_int dummy

# Player radiation status
scoreboard objectives add sr_is_radiated dummy

# Raycast
scoreboard objectives add sr_raycast dummy

# Has full hazmat suit
scoreboard objectives add sr_has_equipment dummy


# Set Constants
scoreboard players set $_end_of_day sr_int 12000