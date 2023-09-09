# Animation frames play every 0.5 seconds and reset after 10 frames

# Increase animation frame
scoreboard players add $_sr_animation_frame sr_int 1
execute if score $_sr_animation_frame sr_int matches 60 run scoreboard players reset $_sr_animation_frame sr_int

scoreboard players operation $_sr_anim_frame_is_odd sr_boolean = $_sr_animation_frame sr_int
# scoreboard players set $_sr_anim_frame_is_odd sr_boolean 5
scoreboard players operation $_sr_anim_frame_is_odd sr_boolean %= $_sr_const_2 sr_int

# Decontamination Kit animations
function sr:scripts/animations/decontamination_kit/sounds
function sr:scripts/animations/decontamination_kit/particles



schedule function sr:scripts/animations/animation_main_loop 10t