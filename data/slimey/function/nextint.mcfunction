# uses black magic to call java's nextInt() function with the seed set in the loottableseed. special loot table means it calls nextInt(10)
forceload add 0 0
$setblock 0 -64 0 barrel{LootTable:"slimey:next_int10",LootTableSeed:$(d3)$(d2)$(d1)$(d0)L} destroy
item replace block 0 -64 0 container.* from block 0 -64 0 container.*
execute if items block 0 -64 0 container.* dirt run scoreboard players set $is_slime_chunk slimey.data 1
forceload remove 0 0