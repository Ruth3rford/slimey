$data modify storage slimey:main seed_text set value "$(d3)$(p2)$(p1)$(p0)"

$execute if data storage slimey:main {d3:0} run data modify storage slimey:main seed_text set value "$(d2)$(p1)$(p0)"
$execute if data storage slimey:main {d3:0,d2:0} run data modify storage slimey:main seed_text set value "$(d1)$(p0)"
$execute if data storage slimey:main {d3:0,d2:0,d1:0} run data modify storage slimey:main seed_text set value "$(d0)"
execute if data storage slimey:main {seed_text:"0"} run data modify storage slimey:main seed_text set value "281474976710656"

function slimey:nextint/place_barrel with storage slimey:main