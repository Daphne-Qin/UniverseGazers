# UniverseGazers: Inspired by Jetpack Joyride
APCS Final Project

## Basic Information
- **Group Name**: UniverseGazers
- **Group member names**: Judy Chen, Daphne Qin
- **Brief Project description**: We would like to replicate Jetpack Joyride in processing, except we’ll name it UniverseGazers, as it’ll be space themed instead of mechanics themed. It  will implement similar iconic features to the actual Jetpack Joyride mobile game, such as allowing the player to collect coins along the way and requiring the player to avoid obstacles. As the game progresses, the player will face more challenges that make it harder to avoid the obstacles, such as laser beams that force the player to stay within a certain area of the screen, or missiles that fly across the screen. Once the player dies, their total score will be supplemented by the value that results from doubling the number of coins they collected. There will also be other optional features that are detailed in the optional features section of our prototype.

[NEW Prototype](https://docs.google.com/document/d/1DknRAS9jda4gOVyg9hIqqR83yfPU9ud-cAbR4dCHGTc/edit?usp=sharing), 
[ORIGINAL Prototype](https://docs.google.com/document/d/189F9OhO6VNhNR0iS9Ybe8OsrwMNg-A3QnAEKoP5iDC8/edit?usp=sharing), and
[Original Gameplay](https://youtu.be/OhU7tLtOIgE)

## Running and Compiling Instructions
#### Compiling
No need to compile anything. Go to running instructions.
#### Running
Open the UniverseGazers file within the directory (post-cloning), then open the `UniverseGazers.pde` file and you should have 9 processing tabs. Press play. There are no cheat codes, and we recommend pressing 'i' at the start page first to read some instructions we added (specifically keyCodes). Additionally, running the sketch multiple times would help guarantee that you see all of our features since they are randomized.

## Development Log
Note: To refer to `UniverseGazers.pde`, we use `Game` since that was the original name we had for the file in both our prototype document and the UML. Also, using "UniverseGazers" conflicts with the name of the entire game.

### June 13, 2022 (Due Date!)
**We** had a good night's sleep since we wanted to be rested. Then we turned in our final prototype.

### June 10-12, 2022 (Friday and the Weekend)
**Judy** focused on beautifying the features of our game. For instance, she changed the color scheme and font, as well as the text alignment on the start page, end page, and to match the overall theme of the game (space, universe, etc.). She also changed the appearance of `Laser` objects by using processing tools such as `strokeWeight()`. She altered the `DANGERTIME` implementation for `Laser`s as well. There were also some constants that she altered such as the `scrollLeft` decrement value and frequency of `Laser` spawning. Furthermore, she wrote the compiling and running instructions for the `README.md` file, and also made a ton of edits to the prototype document using green to signify additions and strikethroughs to signify removals. 

**Daphne** imported the various `Spacemen` (blue), `Coin`, and `Player` assets. In the `Game` class, she then initialized and scaled them in `initializeImages()`, and she changed `moveElements()` to `controlElements()` to better reflect the content of that method. She also edited the various classes (all except `Laser`) to use variables instead of hard-coded variables. She then added an `animations` variable to toggle `Coin` and `Spacemen` animations since they could potentially cause lagging. She finally fixed the score calculation bug and added the cause of death to `endPage()`. She then beautified the code and made it concise, editing and getting rid of multiple variables and methods in the process (minor changes that do not change functionality).

**We** finished! YAY! 

### June 8-9, 2022 (Combining 8 and 9 because we had no school on the 9th)
**Judy** added more images to the `Assets` folder, specifically the images for `Player`, `Missile`, and `Spacemen` objects. She also resized the images such that it would be more visible and beautified, but we have yet to alter the `isTouching()` methods to more appropriately accomodate the new sizes. As for `Spacemen` objects, she doesn't like the way the images look right now, so she'll figure that out later. She also changed the frequency of two objects.

**Daphne** changed the frequency and spacing of the bullets. She added the `countdown` variable to the `spawnBullets()` method and set it to 7 to reflect the frequency that they shoot out in the gamme. She also imported a `Coin` image and replaced the `Player` image to the sprite that's in the game. She then fixed the positioning issue for both `Player` and `Spacemen` (and had `Spacemen` display).

**We** are focusing on beautification and smaller mechanical bugs.

### June 7, 2022 (also happens to be our demo date)
**Judy** made the `Assets` folder and added two images for `Obstacle`s.

**Daphne** fixed the `ConcurrentModificationException`. For `Bullet`s, she changed `getdx()` and `getdy()` to `getXSpeed()` and `getYSpeed()`, and randomized `dy` to be between 25 and 35.

**We** got on a Zoom call. Then we created a new helper method for the `setup()` method, which is called `initializeImages()`. We also created a new public variable called `obstacleImage`. Then, for the `Obstacle` class, we edited the `display()` method to replace the purple rectangles with upright `Obstalce`s (we have yet to do horizontal `Obstacle`s).

### June 6, 2022
**Judy** added another instance variable to the `Player` class called `goingUp`, which is a boolean that tells us whether the Player is moving up or not. This was done to assist the `Bullet` mechanics (it only shoots out when the `Player` moves up); to get started on `Bullet` mechanics, she wrote the `spawnBullet()` method in `UniverseGazers` and a loop and conditional to call it appropriately. Furthermore, She also altered the `Missile` `display()` method such that each Missile would also have a lighter pink border, and made the `Laser`s skinner and have a smaller `DANGERTIME`.

**Daphne** worked on the `Laser` class. She wrote the `move()` method, which shoots in three different directions at varying angles to the left and straight down. She also wrote `isTouchingCoin()`, which collects `Coin`s and adds them to `currentCoins` in the `Game` class if hit. She started implementing `Coin`-collecting by bullet in the `moveElements()` method of the `Game` class, but got a `ConcurrentModificationException` when she tried to do so. She will fix the bug tomorrow.

### June 3-5, 2022 (Friday and the weekend)
**Judy (who was out on Friday but will be back on the 6th)** added headers for `spawnLasers()` and `spawnBullets()`, and edited the `display()` method for the `Laser`, `Bullet`, and `Coin` class to account for beautification (adding a "C" to the center of each `Coin`) and distinction (making `Laser`s lines instead of rectangles). She also merged her branch into `main` branch.

**Daphne** worked on displaying and placing `Lasers`. She implemented a `countdown` variable inside of `Laser`, and when it reaches `0` then the `Game` class will remove it. She also coded `spawnLasers()` so that `Laser`s won't spawn if there's already active `Laser`s and so that there can be multiple `Laser`s at once (with decreasing probability of higher numbers of `Laser`s).

### June 2, 2022
**Judy (who is still out due to COVID)** completed the code needed for `Missile`s to fly across the screen and kill the player when they come in contact. She set a frequency for the `Missile`s and made them fly across quicker than regular `Obstacle`s. Her plan for `Missile` objects is to eventually give the player a warning sign right before they fly across.

**Daphne** tidied up both the `Game` and `CoinLayouts` classes. To `CoinLayouts`, she added two new layouts: `bigArrow` and `coins` (which displays "COINS!!!"). In the `Game` class, she also added a new variable called `countdown` to deal with the *space game immediate restart* bug, and she also added deletion of `Objects` in the `ArrayLists` once they scroll far to the left of the playable screen. In the `Spacemen` class, she added `getX()`. She also revamped the `Laser` code and plans on completing it tomorrow.

Here's a full list of the `Game` class changes:
- lots and lots of comments
- `countdown` variable added
- ending mechanism changed:
  - <ins>Purpose</ins>: this fixes the bug where, if you were holding space when you died, you would automatically start a new game without seeing the end screen)
  - the old `end()` is now called `endPage()`
  - the new `end` sets the mode to `END` (thus calling `endPage()`), then sets `countdown` to `1000`
  - `keyPressed()` will not let you start a new game unless `countdown` is `0`
- `makeLists()` combines all of:
  - `makeBulletList()`
  - `makeCoinList()`
  - `makeMissleList()`
  - `makeObstacleList()`
  - `makeSpacemenList()`
- `game()` mechanism changed:
  - `game()` calls upon `moveElements()` as a helper function
  - `moveElements()` has all the `display()`/`move()`/`isTouching()` mechanisms (it was getting long and making `game()` harder to read)
  - `Objects` in the various `ArrayLists` will now be removed if their x-coordinate is `-1000` (to save space and hopefully speed things up)
    - Because of that, `Spacemen` has a new `getX()` accessor method

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
