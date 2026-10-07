execute if score $init slimey.data matches 1 run return 1
scoreboard objectives add slimey.data dummy
scoreboard players set $init slimey.data 1
scoreboard players set #65536 slimey.data 65536
scoreboard players set #5947611 slimey.data 5947611
scoreboard players set #389711 slimey.data 389711
scoreboard players set #4987142 slimey.data 4987142
execute store result score $worldseed.lo slimey.data run seed
forceload add 0 0 0 0
setblock 0 -64 0 command_block{Command:"seed",auto:1b,TrackOutput:1b} destroy
schedule function slimey:get_seed 2t replace