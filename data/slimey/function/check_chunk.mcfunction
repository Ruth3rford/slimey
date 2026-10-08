scoreboard players set $is_slime_chunk slimey.data 0
scoreboard players operation $seed.hi slimey.data = $worldseed.hi slimey.data
scoreboard players operation $seed.lo slimey.data = $worldseed.lo slimey.data

execute store result score $X.pos slimey.data run data get entity @s Pos[0] 0.0625
execute store result score $Z.pos slimey.data run data get entity @s Pos[2] 0.0625

#X * 0x5ac0db int (VAL A)
scoreboard players operation $val.A slimey.data = $X.pos slimey.data
scoreboard players operation $val.A slimey.data *= #5947611 slimey.data

#X*X * 0x4c1906 int (VAL B)
scoreboard players operation $X.pos slimey.data *= $X.pos slimey.data
execute store result score $val.B slimey.data run scoreboard players operation $X.pos slimey.data *= #4987142 slimey.data

#Z * 0x5f24f int (VAL C)
scoreboard players operation $val.C slimey.data = $Z.pos slimey.data
scoreboard players operation $val.C slimey.data *= #389711 slimey.data

### VAL D
#Z*Z int
scoreboard players operation $Z.pos slimey.data *= $Z.pos slimey.data

#Z*Z*0x4307a7 long split into hi and lo
execute store result score $val.D_lo slimey.data run compute default integer slimey:d_lo
execute store result score $val.D_hi slimey.data run compute default integer slimey:d_hi
###

### seed + sum
execute store result score $seed.hi slimey.data run compute default integer slimey:seed_sum_hi
execute store result score $A slimey.data run compute default integer slimey:seed_sum_lo

### XOR STEP
execute store result score $seed.lo slimey.data run compute default integer slimey:xor

#convert to strings and concatenate as a seed for nextInt()

execute store result score $b slimey.data run compute default integer {type:floor_mod,left:{type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.lo"}},right:65536},right:65536}
execute store result score $c slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.lo"}},right:65536}

execute store result score $U slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.hi"}},7296]},{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}},5536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$c"}}]}
execute store result score $V slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.hi"}},9496]},{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}},6]},{type:"floor_div",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$U"}},right:10000}]}
execute store result score $W slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.hi"}},42]},{type:"floor_div",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$V"}},right:10000}]}

data modify storage slimey:main d0 set compute default integer {type:"floor_mod",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$U"}},right:10000}
data modify storage slimey:main d1 set compute default integer {type:"floor_mod",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$V"}},right:10000}
data modify storage slimey:main d2 set compute default integer {type:"floor_mod",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$W"}},right:10000}
data modify storage slimey:main d3 set compute default integer {type:"floor_div",left:{type:score,score:"slimey.data",target:{type:fixed,name:"$W"}},right:10000}
function slimey:nextint/nextint with storage slimey:main

execute if score $is_slime_chunk slimey.data matches 1 run return 1