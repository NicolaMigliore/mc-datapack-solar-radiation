#####################################################################
#                                                                   #
#       Author: NicolaMigliore                                      # 
#       Github: NicolaMigliore                                      #
#                                                                   #
# ---------------------------------------------------------------   #
#                         FUNCTION INFO                             #
# ---------------------------------------------------------------   #
#       Check the rime of day and set scoreboard is_day             #
#                                                                   #
#####################################################################

# Update daytime variable
execute store result score $daytime sr_int run time query daytime

# Set $is_day variable
execute store success score $is_day sr_boolean if score $daytime sr_int <= $_end_of_day sr_int
