execute store result storage seed:main power2 int 1 run scoreboard players get $temp .data
$scoreboard players set #$(power2) .data $(power2)
scoreboard players operation $temp .data *= #2 .data
execute unless score $temp .data matches 536870913.. run function seed:numbers with storage seed:main