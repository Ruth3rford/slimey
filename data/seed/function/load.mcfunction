scoreboard objectives add .data dummy

scoreboard players set #-1 .data -1
scoreboard players set #2 .data 2
scoreboard players set #1 .data 1
scoreboard players set #4 .data 4
scoreboard players set #8 .data 8
scoreboard players set #16 .data 16
scoreboard players set #32 .data 16
scoreboard players set #10 .data 10

scoreboard players set #65536 .data 65536
scoreboard players set #256 .data 256

scoreboard players set #4987142 .data 4987142
scoreboard players set #5947611 .data 5947611
scoreboard players set #389711 .data 389711



scoreboard players set $temp .data 1
function seed:numbers with storage seed:main


setblock 0 0 0 air
setblock 0 0 0 command_block{Command:"seed",auto:1b,TrackOutput:1b}
data modify storage seed:main seed set string block 0 0 0 LastOutput.extra[0].with[0].with[0].click_event.value
function seed:seed/split with storage seed:main

data merge storage seed:output {set_seed:[0,0],next_int:[0,0]}