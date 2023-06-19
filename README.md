# mc-datapack-solar-radiation
Solar Radiation Datapack. Add a layer of challenge to minecraft survival, by making the sun dangerous to the player.

## Rules
- If player has no valid cover above then they will receive radiation poisoning.
- For a cover to be valid it must:
    - be at least 3 blocks thick
    - be composed of non transparent blocks
    - Tinted glass counts as a non transparent block
- More time you spend in the sun more radiation you will accumulate
- There are 4 different radiation levels, with different effects:
    - Level 1: Slowness and glow
    - Level 2: Mining fatigue
    - Level 3: Hunger
    - Level 4: Nausea
    - Level 5: Poison
    - Level 6: Wither



Current implementation will work for 4 players. This should be updated to manage 20 players.

### Recipes

## Dev Notes
Notes that will be used for development. Eventually these notes will be removed from the README file.

### Todo
Some notes of features to implement.
1. To allow the player to be ready for the radiations, the activation of the datapack should enable a preparation period of about 1 or 2 days in which the player can dig/build a bunker.
2. Radiation should be transferable between players. If a player is radiated and comes within 5 blocks of another player the radiation should spread (NOTE: avoid then looping between players)
3. Radiation should kill nearby animals. If a player is radiated ad comes within 5 blocks of an animal, the animal should die.
4. Check weather. Players should be allowed to go outside when it rains.
5. Check every loop if the current number of players exedes the max player count. if so, send a message in chat and stop the *sr:scripts/radbar/assign_id* from running