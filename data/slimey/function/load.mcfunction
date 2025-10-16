scoreboard objectives add slimey.data dummy

scoreboard players set #-1 slimey.data -1
scoreboard players set #2 slimey.data 2
scoreboard players set #1 slimey.data 1
scoreboard players set #4 slimey.data 4
scoreboard players set #8 slimey.data 8
scoreboard players set #16 slimey.data 16
scoreboard players set #10 slimey.data 10

scoreboard players set #65536 slimey.data 65536
scoreboard players set #256 slimey.data 256

scoreboard players set #4987142 slimey.data 4987142
scoreboard players set #5947611 slimey.data 5947611
scoreboard players set #389711 slimey.data 389711


execute if data storage slimey:main power2 if data storage slimey:main seed run return 1
data merge storage slimey:main {power2:0,slimey:""}
scoreboard players set $temp slimey.data 1
function slimey:init/numbers with storage slimey:main
forceload add 0 0 0 0
setblock 0 0 0 command_block{Command:"seed",auto:1b,TrackOutput:1b} destroy
schedule function slimey:init/get_seed 2t replace
