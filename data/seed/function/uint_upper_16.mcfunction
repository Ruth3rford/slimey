$execute if score $(target) .data matches 1.. run return run scoreboard players operation $(target) .data /= #65536 .data
$scoreboard players add $(target) .data 2147483647
$scoreboard players add $(target) .data 1
$scoreboard players operation $(target) .data /= #65536 .data
$scoreboard players add $(target) .data 32768