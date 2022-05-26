# UniverseGazers: Inspired by Jetpack Joyride
APCS Final Project

## Basic Information
- **Group Name**: UniverseGazers
- **Group member names**: Judy Chen, Daphne Qin
- **Brief Project description**: We would like to replicate Jetpack Joyride in processing, except we’ll name it UniverseGazers, as it’ll be space themed instead of mechanics themed. It  will implement similar iconic features to the actual Jetpack Joyride mobile game, such as allowing the player to collect coins along the way and requiring the player to avoid obstacles. As the game progresses, the player will face more challenges that make it harder to avoid the obstacles, such as laser beams that force the player to stay within a certain area of the screen, or missiles that fly across the screen. Once the player dies, their total score will be supplemented by the value that results from doubling the number of coins they collected. There will also be other optional features that are detailed in the optional features section of our prototype.


[Prototype](https://docs.google.com/document/d/189F9OhO6VNhNR0iS9Ybe8OsrwMNg-A3QnAEKoP5iDC8/edit?usp=sharing) and [Original Gameplay](https://youtu.be/OhU7tLtOIgE)

## Development Log
### June 13, 2022 (Due Date!)
### June 10, 2022
### June 9, 2022
### June 8, 2022
### June 7, 2022
### June 6, 2022
### June 3, 2022
### June 2, 2022
### June 1, 2022
### May 31, 2022
### May 30, 2022
### May 27, 2022
### May 26, 2022
### May 25, 2022
**Daphne** worked on `Game` and `Player`. Within `Game`, she implemented a `ceiling` and `floor` variable for convenience, and had `game()` display the ceiling, floor, and `currentScore`. For `Player`, she finished the `move()` method, so the circle now moves up (through space key) and down (when space isn't pressed). She merged these changes into `main`.

### May 24, 2022
**Judy** worked on the `Coin`, `Player`, and started the `Obstacle` class, by adding some detail to the display methods and revising the methods she had written yesterday (for clarity, efficiency, and bugs). For homework, she'll write the `instructions()` method in the `Game` class. She also wrote the class skeletons for `Missile` and `Laser`.

**Daphne** worked a bit more on the `Game` class by adding an "`i`" key toggle between the start page and the instructions; she also made the mode variables public so it's accessible from other classes. She also started work on the `Bullet` class.

**We** merged our branches into the main branch for the first time today. This includes:
- **`Game`**: `startPage()`, `end()`, and `int mode` implementations.
- **Other Classes**: skeletons, constructors, and basic functionality.

### May 23, 2022
**Judy** worked on the `Player`, `Spacemen`, and `Coin` classes, but excluded all beautification aspects for now; she wrote the main methods and algorithms for each method in the three classes (minus `isTouching()` and `move()` for `Player`) but plans on tweaking the numbers later on.

**Daphne** worked on the `Game` class (which has filename `UniverseGazers.pde`). She finished `end()` and `checkHighScore` (so the bare basics of the ending screen is done). She also implemented a `mode` system stored through `private int mode`. She also implemented the skeleton for the rest of the file.
