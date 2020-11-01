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

# # Player radiation status
# scoreboard objectives add sr_is_radiated dummy

# Raycast
scoreboard objectives add sr_raycast dummy

# Has full hazmat suit
scoreboard objectives add sr_has_equipment dummy

# Current shelter thickness
scoreboard objectives add sr_cur_shelter dummy


# Set Constants
scoreboard players set $_end_of_day sr_int 12000
scoreboard players set $_min_shelter sr_int 3