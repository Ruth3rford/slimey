execute if score $init slimey.data matches 1.. run return 1
forceload add 0 0 0 0
scoreboard objectives add slimey.data dummy
scoreboard players set $init slimey.data 1
scoreboard players set #65536 slimey.data 65536
scoreboard players set #5947611 slimey.data 5947611
scoreboard players set #389711 slimey.data 389711
scoreboard players set #4987142 slimey.data 4987142
execute store result score $worldseed.lo slimey.data run seed
