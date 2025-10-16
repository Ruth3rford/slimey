$execute if score $(target) slimey.data matches 1.. run return run scoreboard players operation $(target) slimey.data /= #65536 slimey.data
$scoreboard players add $(target) slimey.data 2147483647
$scoreboard players add $(target) slimey.data 1
$scoreboard players operation $(target) slimey.data /= #65536 slimey.data
$scoreboard players add $(target) slimey.data 32768