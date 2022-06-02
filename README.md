# UniverseGazers: Inspired by Jetpack Joyride
APCS Final Project

## Basic Information
- **Group Name**: UniverseGazers
- **Group member names**: Judy Chen, Daphne Qin
- **Brief Project description**: We would like to replicate Jetpack Joyride in processing, except we’ll name it UniverseGazers, as it’ll be space themed instead of mechanics themed. It  will implement similar iconic features to the actual Jetpack Joyride mobile game, such as allowing the player to collect coins along the way and requiring the player to avoid obstacles. As the game progresses, the player will face more challenges that make it harder to avoid the obstacles, such as laser beams that force the player to stay within a certain area of the screen, or missiles that fly across the screen. Once the player dies, their total score will be supplemented by the value that results from doubling the number of coins they collected. There will also be other optional features that are detailed in the optional features section of our prototype.


[Prototype](https://docs.google.com/document/d/189F9OhO6VNhNR0iS9Ybe8OsrwMNg-A3QnAEKoP5iDC8/edit?usp=sharing) and [Original Gameplay](https://youtu.be/OhU7tLtOIgE)

## Development Log
Note: To refer to `UniverseGazers.pde`, we use `Game` since that was the original name we had for the file in both our prototype document and the UML. Also, using "UniverseGazers" conflicts with the name of the entire game.

### June 13, 2022 (Due Date!)
### June 10-12, 2022
### June 9, 2022
### June 8, 2022
### June 7, 2022
### June 6, 2022
### June 3, 2022
### June 2, 2022
**Judy (who is still out due to COVID)** completed the code needed for `Missile`s to fly across the screen and kill the player when they come in contact. She set a frequency for the `Missile`s and made them fly across quicker than regular `Obstacle`s. Her plan for `Missile` objects is to eventually give the player a warning sign right before they fly across.

### June 1, 2022
**Judy (who is still out due to COVID)** completed all the code needed for functional `Spacemen` objects. The general mechanics of these objects are completed, aside from their relationship to `Bullet` objects. Also, she made the decision to override the `move()` method in `Obstacle` with a new `move()` method in `Missile` that would make objects bob up and down as they fly left. She started on writing this method.

**Daphne** edited `spawnCoins()` to prevent newly added `Coins` from overlapping with `Obstacles` and other `Coins`.

### May 31, 2022
**Judy (who is out due to COVID)** started to implement `Spacemen` objects into the `Game` class, but only completed about half or so of the code needed for functional `Spacemen` objects. She added a method in the `Spacemen` that checks whether a `Spacemen` object is touching a `Bullet` object. Additionally, she added accessor methods to the `Bullet` class and privatized the instance variables. Everything here has been merged into `main` branch.

**Daphne** added two new variables to the `Player` class: `ACCELERATION` and `GRAVITY`. Instead of having `dy` being two separate constants, either `ACCELERATION` (when the space key is pressed) or `GRAVITY` (when the space key isn't pressed) will be added. She also edited the `scrollLeft` acceleration code so that it continually increments the scroll speed and added a speed maximum so that it doesn't go beyond -20.

### May 27-30, 2022 (Memorial Day Weekend combined with Friday)
**Judy** imported an image within the `Game` class so that there would be a background whenever the game is started. She also wrote the `instructions()` method within the `Game` class. In order to display a randomized selection (orientation) of `Obstacle` objects as the game progresses, she wrote a loop within the `Game` class to continuously add obstacles to an `ArrayList` of `Obstacle`s. She also introduced game scrolling acceleration by subtracting from `scrollLeft` (which uses negative numbers).

**Daphne** revamped the `Coin` method so that it stores only one shape at a time, instead of an ArrayList of them. She also added `wid` and `ht` variables to `Obstacle` (and thus removed them from `Missle` since those were redundant). She implemented both `isTouchingCoin` (to add coins) and `isTouchingObstacle` (formerly `isTouching`, causes player death). She added `CoinLayouts` to hard-code some of the layouts of the clumps of coins as they appear in Jetpack Joyride. She then introduced an (imperfect) algorithm that will prevent `Obstacles` from overlapping with `Coins` and other `Obstacles` (there's yet to be one for the `Coin` clumps). She also organized the classes a bit.

**We** created the `demo` branch. Additionally, here's a more organized list of the changes we made.
- Added a background
- Revamp `Coin` class to store information for only one shape
- Added deaths and coin-adding in clumps
- Added Obstacle randomization and got rid of overlap
- Generally organized placement of methods and added comments
- We have our MVP! YAY! (Well, minus the `Spacemen` objects but those contribute minimally to the mechanics of the game, if at all). It works the way we intended.

### May 26, 2022
**Judy** worked on the `Game` and `Obstacle` class. I finished two constructors in the `Obstacle` class, and added one line of code to the `move()` method in the class. She also added 3 methods to the `Game` class, which include `makeObstacleList()`, `makeBulletList()`, and `makeSpacemenList()`.  Now, an `Obstacle` object appears when we run the program, but so far it doesn't move to the left yet.

**Daphne** added a `scrollLeft` variable to the `Game` class, which will force all `Obstacle`s except `Laser`s to move to the left (like in the real game). She also worked on the basics of the `Missle` to allow it to display and return width and height. She briefly worked on `Laser`'s' `display()` method, and added an *empty* `move()` command to override the parent.

**We** merged our changes at the end of class, and resolved a merge conflict.

### May 25, 2022
**Judy** worked on `Player` and `Obstacle`. Within `Obstacle`, she got rid of the `abstract` keyword because it doesn't make sense in our goals, and wrote the `isTouching()` method in `Player`, that way, whenever the player comes into contact with an `Obstacle` object, it dies (will be implemented in `Game` later). She merged changes into the main branch.

**Daphne** worked on `Game` and `Player`. Within `Game`, she implemented a `ceiling` and `floor` variable for convenience, and had `game()` display the ceiling, floor, and `currentScore`. For `Player`, she finished the `move()` method, so the circle now moves up (through space key) and down (when space isn't pressed). She merged these changes into `main`.

Since the mechanics of `Player` and its relationship to `Obstacle` objects is coming along, our proof of concept is developed (or close to developed).

### May 24, 2022
**Judy** worked on the `Coin`, `Player`, and started the `Obstacle` class, by adding some detail to the display methods and revising the methods she had written yesterday (for clarity, efficiency, and bugs). For homework, she'll write the `instructions()` method in the `Game` class. She also wrote the class skeletons for `Missile` and `Laser`.

**Daphne** worked a bit more on the `Game` class by adding an "`i`" key toggle between the start page and the instructions; she also made the mode variables public so it's accessible from other classes. She also started work on the `Bullet` class.

**We** merged our branches into the main branch for the first time today. This includes:
- **`Game`**: `startPage()`, `end()`, and `int mode` implementations.
- **Other Classes**: skeletons, constructors, and basic functionality.

### May 23, 2022
**Judy** worked on the `Player`, `Spacemen`, and `Coin` classes, but excluded all beautification aspects for now; she wrote the main methods and algorithms for each method in the three classes (minus `isTouching()` and `move()` for `Player`) but plans on tweaking the numbers later on.

**Daphne** worked on the `Game` class (which has filename `UniverseGazers.pde`). She finished `end()` and `checkHighScore` (so the bare basics of the ending screen is done). She also implemented a `mode` system stored through `private int mode`. She also implemented the skeleton for the rest of the file.
