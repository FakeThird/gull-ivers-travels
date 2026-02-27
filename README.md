# About `gull-ivers-travels`

![Gif that shows the title screen art](https://github.com/user-attachments/assets/460e4cad-d0e0-4c27-ac4f-3597c85cffb4) ![Gif that shows a quick gameplay](https://github.com/user-attachments/assets/5cb1ab39-54cb-45aa-bd6b-dab586d96732)

# Creator
- Keith Ashly M. Domingo
- Adriel Neyro Caraig

**Date: February 27, 2026**

# Description

## Summary
**`gull-ivers-travels`** follows Iver the Seagull on his journey to reach the ocean's end. In this game, you play as Iver the Seagull himself as he tries to dodge sharks and obstacles while trying to eat fish to stay alive. Although, one has to be remember that the seas are not his domain nor the skies. It's a game all about managing your stats while also perserving through hardship.

## Rationale
**`gull-ivers-travels`** is a *flappy bird clone* with a twist, which was created as the first machine problem for CMSC 197 - Game Design and Development. To challenge the student's creativity and ingenuity, they were given a task to take an already existing game, analyze its game design, and create a unique recreation of the game while being restricted to keep the major features of the original game.

# Features

**`gull-ivers-travels`** offers both unique mechanics and some that were in *flappy bird*:

**The Bird**
- the idea as the main playable character as the bird has been kept but instead it's now a `seagull`.
- the flapping from *flappy bird*, where an input means to flap once has been kept albeit with a twist.

**The Pipes**
- the pipes has been changed to three various obstacles which to be explained in the game mechanics.
- the procedural spawning has been implemented, proper collision detection, and `object pooling`.

**Scoring**
- while the *flappy bird* scored each obstacle passed, the game instead scores the length of survival using `distance`.

**Game States**\
Three distinct game states has been implemented:
- Menu/Idle State: The initial state before gameplay begins
- Playing State: Active gameplay with input response and physics
- Game Over State: Triggered on collision, displays score and restart option

**Player Stats**
- a survival and management mechanic has been added with the implementation of player statistics such as stamina and weight.

**Milestone Titles**
- *flappy bird* awards certain medals when reaching a certain amount of points, which was kept but instead gives you a title that refers to your bird.

**Design Overhaul**
- *flappy bird* excels at simple but addictive, but the game wants to let the player enjoy while still being relaxed with soothing music and a view over the horizon.

# Game Mechanic

- **Stamina and Weight:** Instead of just flapping endlessly, Iver has a `stamina` and `weight` property. With each flap, you consume a part of your stamina and weight. To survive, Iver must eat the fish that appear in the ocean. Be careful though, as there is a limit to how much stamina you can gain, and overeating may cause you to gain excessive weight. This, of course, hinders Iver's ability to fly and makes his flaps less powerful. To balance this, Iver loses a small portion of his weight over time.

- **Food and Obstacles:** Iver sees a lot of things as he traverses the open ocean. By looking below, he can see `fishes` that he can eat to regain stamina. Unfortunately, the same waters are populated by sharks that have the ability to jump and kill Iver. Additionally, there are other obstacles like `buoys`, `rocks`, and `boats` that Iver must dodge in order to continue his journey.

- **Sea and Sky:** As a seagull, Iver is at the mercy of the environment around him. Though he can dive into the ocean to get some fish for food, he cannot really breathe under the water. This gives him only a few seconds until he dies of `drowning`. On the other hand, Iver is also scared to fly high in the clouds. He knows that if he stays up there for too long, a `larger bird` might spot him and have him for lunch. 

There might be more implementations and mechanics in future updates so stay tuned!

# Controls Documentation
As the player, you can only interact with the game using the `spacebar`, although if the user prefers a `mouse` can be used to click the button in the title screen to start the game. Each `spacebar` input either makes Iver flap one time or interacts with the HUD to restart the game. 

# Limitations and Issues
- **(UI) Fixed screen size:** As the UI is not dynamic, adjusting the screen size might give some visual problems but overall no game breaking bugs were found.
- **(Game) Unoptimized collision shapes:** Multiple Rectangle Collision shapes were used instead of a singular Polygonal Collision shape.
- **(Audio) Repeated sounds upon player death:** Collision happens twice when the player has been hit from a shark going up and down causing a repeat of death sounds.

# Graphics and Tools 
- Game Engine used: [Godot](https://godotengine.org/download/windows/)
- Pixilart Studio: [Pixilart](https://www.pixilart.com/)
- Audacity: [Audacity](audacityteam.org)

# Credits

Credits to the people who made some of the sprites of the game which came from the following websites:
- Itch.io Game Assets: [Itch.io](https://itch.io/game-assets)
- Craftpix Game Assets: [Craftpix](https://craftpix.net/)

Credits to the people who made the free sounds effects that came from the following websites:
- Pixabay Sound Effects: [Pixabay](https://pixabay.com/)

A direct link to each respective download will be given in the [CREDITS.md](CREDITS.md), these artists indirectly supported in this project success!

# Getting Started: Players
To properly try and experience **`gull-ivers-travels`**, you may follow the given steps:
1. Download the exe file in the [releases section](https://github.com/FakeThird/gull-ivers-travels/releases/tag/v1.0.0) of the repository.
2. Run the exe and enjoy the game!

# License

- This game was created as a passionate machine problem for CMSC 197 - Game Design and Development.
- **All Credits of Sprites and Original Inspiration goes to their respective owners.** 
- Sprites not credited were custom built by the creators and is free for personal, non-commercial use.
