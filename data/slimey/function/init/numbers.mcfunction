execute store result storage slimey:main power2 int 1 run scoreboard players get $temp slimey.data
$scoreboard players set #$(power2) slimey.data $(power2)
scoreboard players operation $temp slimey.data *= #2 slimey.data
execute unless score $temp slimey.data matches 536870913.. run function slimey:init/numbers with storage slimey:main