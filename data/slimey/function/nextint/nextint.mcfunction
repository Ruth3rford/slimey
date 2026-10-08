$data modify storage slimey:main p0 set value "0000$(d0)"
data modify storage slimey:main p0 set string storage slimey:main p0 -4

$data modify storage slimey:main p1 set value "0000$(d1)"
data modify storage slimey:main p1 set string storage slimey:main p1 -4

$data modify storage slimey:main p2 set value "0000$(d2)"
data modify storage slimey:main p2 set string storage slimey:main p2 -4

function slimey:nextint/assemble_seed with storage slimey:main

item replace block 0 -64 0 container.* from block 0 -64 0 container.*
execute if items block 0 -64 0 container.* dirt run scoreboard players set $is_slime_chunk slimey.data 1
setblock 0 -64 0 bedrock replace