scoreboard objectives add bossbar dummy
scoreboard objectives add sr_radbar_left minecraft.custom:minecraft.leave_game

bossbar add bossbar1 ""
bossbar add bossbar2 ""
bossbar add bossbar3 ""
bossbar add bossbar4 ""

bossbar set bossbar1 max 180
bossbar set bossbar2 max 180
bossbar set bossbar3 max 180
bossbar set bossbar4 max 180

bossbar set bossbar1 style notched_6
bossbar set bossbar2 style notched_6
bossbar set bossbar3 style notched_6
bossbar set bossbar4 style notched_6

bossbar set bossbar1 color green
bossbar set bossbar2 color green
bossbar set bossbar3 color green
bossbar set bossbar4 color green

bossbar set bossbar1 name [{"text":"☢ Radiation Levels ☢", "color":"green"}]
bossbar set bossbar2 name [{"text":"☢ Radiation Levels ☢", "color":"green"}]
bossbar set bossbar3 name [{"text":"☢ Radiation Levels ☢", "color":"green"}]
bossbar set bossbar4 name [{"text":"☢ Radiation Levels ☢", "color":"green"}]

# Update to manage 20 players...