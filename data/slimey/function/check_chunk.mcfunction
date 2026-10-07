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
scoreboard players operation $N slimey.data = $Z.pos slimey.data
execute store result score $val.D_lo slimey.data run compute default integer slimey:d_lo
execute store result score $val.D_hi slimey.data run compute default integer slimey:d_hi
###

scoreboard players operation $A slimey.data = $seed.lo slimey.data

#seed + valA
scoreboard players operation $B slimey.data = $val.A slimey.data
execute store result score $seed.hi slimey.data run compute default integer slimey:carry
execute store result score $A slimey.data run compute default integer slimey:add

#+ valB
scoreboard players operation $B slimey.data = $val.B slimey.data
execute store result score $seed.hi slimey.data run compute default integer slimey:carry
execute store result score $A slimey.data run compute default integer slimey:add

#+ valC
scoreboard players operation $B slimey.data = $val.C slimey.data
execute store result score $seed.hi slimey.data run compute default integer slimey:carry
execute store result score $A slimey.data run compute default integer slimey:add

#+ valD
scoreboard players operation $B slimey.data = $val.D_lo slimey.data
execute store result score $seed.hi slimey.data run compute default integer slimey:carry

# D has its own high part, so cancel carry's sign extension of B
execute if score $B slimey.data matches ..-1 run scoreboard players add $seed.hi slimey.data 1

execute store result score $A slimey.data run compute default integer slimey:add
scoreboard players operation $seed.hi slimey.data += $val.D_hi slimey.data
scoreboard players operation $seed.hi slimey.data %= #65536 slimey.data

### XOR STEP
scoreboard players operation $seed.lo slimey.data = $A slimey.data
scoreboard players set $B slimey.data 987234911
scoreboard players operation $seed.lo slimey.data += $B slimey.data
execute store result score $AND slimey.data run compute default integer slimey:and
scoreboard players operation $seed.lo slimey.data -= $AND slimey.data
scoreboard players operation $seed.lo slimey.data -= $AND slimey.data

#convert to strings and concatenate as a seed for nextInt()

scoreboard players operation $a slimey.data = $seed.hi slimey.data
execute store result score $b slimey.data run compute default integer {type:floor_mod,left:{type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.lo"}},right:65536},right:65536}
execute store result score $c slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$seed.lo"}},right:65536}

#1

execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}
execute store result score $a slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}}]}
execute store result score $b slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$c"}}]}
execute store result score $c slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

data modify storage slimey:main chunk set compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
function slimey:limb with storage slimey:main
data modify storage slimey:main d0 set from storage slimey:main padded

#2

execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}
execute store result score $a slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}}]}
execute store result score $b slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$c"}}]}
execute store result score $c slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

data modify storage slimey:main chunk set compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
function slimey:limb with storage slimey:main
data modify storage slimey:main d1 set from storage slimey:main padded

#3

execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}
execute store result score $a slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}}]}
execute store result score $b slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$c"}}]}
execute store result score $c slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

data modify storage slimey:main chunk set compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
function slimey:limb with storage slimey:main
data modify storage slimey:main d2 set from storage slimey:main padded

#4

execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}
execute store result score $a slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$a"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$b"}}]}
execute store result score $b slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
execute store result score $remainder slimey.data run compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

execute store result score $t slimey.data run compute default integer {type:add,inputs:[{type:mul,inputs:[{type:score,score:"slimey.data",target:{type:fixed,name:"$remainder"}},65536]},{type:score,score:"slimey.data",target:{type:fixed,name:"$c"}}]}
execute store result score $c slimey.data run compute default integer {type:floor_div,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}

data modify storage slimey:main chunk set compute default integer {type:floor_mod,left:{type:score,score:"slimey.data",target:{type:fixed,name:"$t"}},right:10000}
data modify storage slimey:main d3 set string storage slimey:main chunk
function slimey:nextint with storage slimey:main
execute if score $is_slime_chunk slimey.data matches 1 run return 1