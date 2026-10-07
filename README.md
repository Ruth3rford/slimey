# Slimey
Lightweight Minecraft Datapack Library that checks for slime chunks by reconstructing Java's random function and Minecraft's slime-chunk seed.

# Usage
Run the `slimey:check` function with a position context at a desired coordinates. You can pass the position either via a macro, running it from an entity context, however you prefer. But it will run that checking function *at* the position it was executed.

# Output
Check the score of `$output` from the scoreboard objective `slimey.data`. If `$output` == 0 then the given coordinates are within a slime chunk. Otherwise, no.
