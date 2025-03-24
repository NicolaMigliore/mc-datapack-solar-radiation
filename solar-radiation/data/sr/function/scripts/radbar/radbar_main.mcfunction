# Run "join" function for players that have joined and players who have recently left.
execute as @a[tag=!user] run function sr:scripts/radbar/join
execute as @a[scores={sr_radbar_left=1..}] run function sr:scripts/radbar/join

execute as @a[scores={bossbar=1..}] run function sr:scripts/radbar/copy_val