data modify storage slimey:main seed set string block 0 -64 0 LastOutput.extra[0].with[0].with[0].click_event.value
function slimey:init/convert with storage slimey:main
setblock 0 -64 0 bedrock replace
execute store result score $worldseed.hi slimey.data run data get storage slimey:main seed 0.00000000023283064365386962890625
scoreboard players operation $worldseed.probe slimey.data = $worldseed.hi slimey.data
execute if score $worldseed.lo slimey.data matches -1024..-1 if score $worldseed.hi slimey.data matches 0.. store result score $worldseed.probe slimey.data run data get storage slimey:main seed 0.0000000002328306435996595202819747783
execute if score $worldseed.lo slimey.data matches -1024..-1 if score $worldseed.hi slimey.data matches -2147483647..-1 store result score $worldseed.probe slimey.data run data get storage slimey:main seed 0.0000000002328306437080797375305252217
execute if score $worldseed.probe slimey.data < $worldseed.hi slimey.data run scoreboard players remove $worldseed.hi slimey.data 1
scoreboard players operation $worldseed.hi slimey.data %= #65536 slimey.data






