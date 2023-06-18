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
    - Level 1: Slowness and mining fatigue
    - Level 2: Nausea and hunger
    - Level 3: Poison and glowing
    - Level 4: Wither, speed, jump boost and haste


## Notes

### Recipes

## Dev Notes
Notes that will be used for development. Eventually these notes will be removed from the README file.

### Todo
Some notes of features to implement.
1. To allow the player to be ready for the radiations, the activation of the datapack should enable a preparation period of about 1 or 2 days in which the player can dig/build a bunker.
2. Radiation should be transferable between players. If a player is radiated and comes within 5 blocks of another player the radiation should spread (NOTE: avoid then looping between players)
3. Radiation should kill nearby animals. If a player is radiated ad comes within 5 blocks of an animal, the animal should die.
4. Check weather. Players should be allowed to go outside when it rains.