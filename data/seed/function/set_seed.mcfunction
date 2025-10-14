## GET CHUNK COORDS

execute store result score $X.pos .data run data get entity @s Pos[0] 0.0625
execute store result score $Z.pos .data run data get entity @s Pos[2] 0.0625

### GET ALL INTS

#X * 0x5ac0db int (VAL A)
execute store result score $val.A .data run scoreboard players operation #5947611 .data *= $X.pos .data

execute store result storage seed:output valA int 1 run scoreboard players get $val.A .data
#X*X * 0x4c1906 int (VAL B)
scoreboard players operation $X.pos .data *= $X.pos .data
execute store result score $val.B .data run scoreboard players operation $X.pos .data *= #4987142 .data

execute store result storage seed:output valB int 1 run scoreboard players get $val.B .data

#Z * 0x5f24f int (VAL C)
execute store result score $val.C .data run scoreboard players operation #389711 .data *= $Z.pos .data

execute store result storage seed:output valC int 1 run scoreboard players get $val.C .data

### VAL D
#Z*Z int
scoreboard players operation $Z.pos .data *= $Z.pos .data

#Z*Z*0x4307a7 long split into hi and lo
execute store result storage seed:main long long 4392871 run scoreboard players get $Z.pos .data
execute store result score $val.D_hi .data run data get storage seed:main long 0.00000000023283064365386962890625
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $val.D_lo .data run data get block 0 0 0 SuccessCount
###

### SUM

#seed + VAL A
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.A .data
execute if score $val.A .data matches ..-1 run function seed:borrow
execute if score $val.A .data matches 1.. run function seed:carry
scoreboard players operation $seed.lo .data = $temp .data

# + VAL B
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.B .data
execute if score $val.B .data matches ..-1 run function seed:borrow
execute if score $val.B .data matches 1.. run function seed:carry
scoreboard players operation $seed.lo .data = $temp .data

# + VAL C
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.C .data
execute if score $val.C .data matches ..-1 run function seed:borrow
execute if score $val.C .data matches 1.. run function seed:carry
scoreboard players operation $seed.lo .data = $temp .data

# + VAL D (hi and lo)
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.D_lo .data
execute if score $val.D_lo .data matches ..-1 run function seed:borrow
execute if score $val.D_lo .data matches 1.. run function seed:carry
scoreboard players operation $seed.lo .data = $temp .data
scoreboard players operation $seed.hi .data += $val.D_hi .data
###

### XOR WITH 0x3ad8025f
#XOR lower 32 bits with 0x3ad8025f
scoreboard players operation $A .data = $seed.lo .data 
scoreboard players set $B .data 987234911
function seed:xor

### CORRECT SO FAR

### XOR WITH LCG CONSTANT AND MASK TO 48
#XOR whole number with multiplier constant and then mod 16 the his to mask to 48 bit

#XOR lower bits with (Mlo 2s complement)
scoreboard players operation $A .data = $output .data
scoreboard players set $B .data -554899859
function seed:xor
scoreboard players operation $seed.lo .data = $output .data
#XOR with the His
scoreboard players operation $A .data = $seed.hi .data
scoreboard players set $B .data 5
function seed:xor
#mod 16 to mask to 48
scoreboard players operation $output .data %= #65536 .data
scoreboard players operation $seed.hi .data = $output .data
### ALL CORRECT ^^^
function seed:nextint