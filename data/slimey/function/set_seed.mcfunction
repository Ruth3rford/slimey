## GET CHUNK COORDS & SEED
execute store result score $seed.hi slimey.data run data get storage slimey:main seed 0.00000000023283064365386962890625
execute store result score $seed.lo slimey.data run seed
execute store result score $X.pos slimey.data run data get entity @s Pos[0] 0.0625
execute store result score $Z.pos slimey.data run data get entity @s Pos[2] 0.0625

### GET ALL INTS

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
execute store result storage slimey:main long long 4392871 run scoreboard players get $Z.pos slimey.data
execute store result score $val.D_hi slimey.data run data get storage slimey:main long 0.00000000023283064365386962890625
data modify entity @s background set from storage slimey:main long
execute store result score $val.D_lo slimey.data run data get entity @s background
###

### SUM

#seed + VAL A
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data += $val.A slimey.data
function slimey:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.A",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo slimey.data = $temp slimey.data

# + VAL B
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data += $val.B slimey.data
function slimey:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.B",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo slimey.data = $temp slimey.data

# + VAL C
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data += $val.C slimey.data
function slimey:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.C",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo slimey.data = $temp slimey.data

# + VAL D (hi and lo)
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data += $val.D_lo slimey.data
function slimey:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.D_lo",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo slimey.data = $temp slimey.data
scoreboard players operation $seed.hi slimey.data += $val.D_hi slimey.data
###

### XOR WITH 0x3ad8025f
#XOR lower 32 bits with 0x3ad8025f
scoreboard players operation $A slimey.data = $seed.lo slimey.data 
scoreboard players set $B slimey.data 987234911
scoreboard players operation $output slimey.data = $A slimey.data
scoreboard players operation $output slimey.data += $B slimey.data

# AND calculation:
scoreboard players reset $and slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players set $and slimey.data -2147483648

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1073741824

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 536870912

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 268435456

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 134217728

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 67108864

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 33554432

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16777216

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8388608

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4194304

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2097152

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1048576

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 524288

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 262144

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 131072

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 65536

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32768

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16384

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8192

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4096

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2048

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1024

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 512

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 256

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 128

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 64

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1
# (End of AND calculation)

scoreboard players operation $output slimey.data -= $and slimey.data
scoreboard players operation $output slimey.data -= $and slimey.data

### CORRECT SO FAR

### XOR WITH LCG CONSTANT AND MASK TO 48
#XOR whole number with multiplier constant and then mod 16 the his to mask to 48 bit

#XOR lower bits with (Mlo 2s complement)
scoreboard players operation $A slimey.data = $output slimey.data
scoreboard players set $B slimey.data -554899859
scoreboard players operation $output slimey.data = $A slimey.data
scoreboard players operation $output slimey.data += $B slimey.data

# AND calculation:
scoreboard players reset $and slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players set $and slimey.data -2147483648

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1073741824

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 536870912

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 268435456

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 134217728

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 67108864

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 33554432

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16777216

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8388608

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4194304

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2097152

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1048576

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 524288

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 262144

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 131072

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 65536

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32768

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16384

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8192

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4096

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2048

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1024

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 512

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 256

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 128

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 64

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1
# (End of AND calculation)

scoreboard players operation $output slimey.data -= $and slimey.data
scoreboard players operation $output slimey.data -= $and slimey.data
scoreboard players operation $seed.lo slimey.data = $output slimey.data
#XOR with the His
scoreboard players operation $A slimey.data = $seed.hi slimey.data
scoreboard players set $B slimey.data 5
scoreboard players operation $output slimey.data = $A slimey.data
scoreboard players operation $output slimey.data += $B slimey.data

# AND calculation:
scoreboard players reset $and slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players set $and slimey.data -2147483648

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1073741824

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 536870912

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 268435456

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 134217728

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 67108864

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 33554432

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16777216

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8388608

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4194304

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2097152

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1048576

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 524288

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 262144

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 131072

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 65536

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32768

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16384

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8192

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4096

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2048

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1024

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 512

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 256

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 128

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 64

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 32

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 16

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 8

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 4

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 2

scoreboard players operation $A slimey.data *= #2 slimey.data
scoreboard players operation $B slimey.data *= #2 slimey.data
execute if score $A slimey.data matches ..-1 if score $B slimey.data matches ..-1 run scoreboard players add $and slimey.data 1
# (End of AND calculation)

scoreboard players operation $output slimey.data -= $and slimey.data
scoreboard players operation $output slimey.data -= $and slimey.data
#mod 16 to mask to 48
scoreboard players operation $output slimey.data %= #65536 slimey.data
scoreboard players operation $seed.hi slimey.data = $output slimey.data
### ALL CORRECT ^^^

#(hi*M)mod 2^32 + (lo*M)>>32 = hi*M+carry
#carry = lo*m >> 32
#(lo*M)mod 2^32 = lo
#add 11 to lo (the lcg constant) and increment hi if necessary
#hi mod 16 to mask to 48 bit
# bitshift lo >> 17 then + hi << 15

#M_lo = 3740067437

##carry over if the seed.lo is signed is the hi base 16 of seed.lo * 25214903917/2^16 mod 2^32 + lo base 16 seed.lo * 25214903917/2^32)
## not a problem if seed.lo is unsigned however

## GETS CARRYOVER
scoreboard players operation $carry slimey.data = $seed.lo slimey.data
#>>> 16 to find upper 16 bits (breaking it down into unsigned ints)
function slimey:uint_upper_16 {target:"$carry"}
#get prodhi mod 16 << 16
execute store result storage slimey:main long long 25214903917 run scoreboard players get $carry slimey.data
data modify entity @s background set from storage slimey:main long
execute store result score $A slimey.data run data get entity @s background
scoreboard players operation $A slimey.data %= #65536 slimey.data
scoreboard players operation $A slimey.data *= #65536 slimey.data
#(hi16 of lo * m >> 16) mod 2^32
execute store result storage slimey:main long long 384748.9001007080078125 run scoreboard players get $carry slimey.data
data modify entity @s background set from storage slimey:main long
execute store result score $carry slimey.data run data get entity @s background
#get lower 16 bits of lo
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data %= #65536 slimey.data

#get prodlo mod 2^32
execute store result storage slimey:main long long 25214903917 run scoreboard players get $temp slimey.data
data modify entity @s background set from storage slimey:main long
execute store result score $B slimey.data run data get entity @s background

#sum prodhi mod 16 << 16 + prodlo mod2^32 if they overflow then add one
scoreboard players operation $A slimey.data += $B slimey.data
execute if score $A slimey.data matches 1.. run scoreboard players operation $A slimey.data /= #65536 slimey.data
execute if score $B slimey.data matches 1.. run scoreboard players operation $B slimey.data /= #65536 slimey.data
execute if score $A slimey.data matches ..-1 run function slimey:uint_upper_16 {target:"$A"}
execute if score $B slimey.data matches ..-1 run function slimey:uint_upper_16 {target:"$B"}
execute if score $A slimey.data < $B slimey.data run scoreboard players add $carry slimey.data 1

# Lo16 of lo * M >> 32
execute store result storage slimey:main long long 5.87080230866558849811553955078125 run scoreboard players get $temp slimey.data
#safely under 32 bits so dont need to mod
execute store result score $temp slimey.data run data get storage slimey:main long 1
scoreboard players operation $carry slimey.data += $temp slimey.data
###

## GETS HI PART + CARRY
#(long) Hi*M
execute store result storage slimey:main long long 25214903917 run scoreboard players get $seed.hi slimey.data
#int32 (hi*m)mod 2^32 = preserved hi bits ignoring overflow
data modify entity @s background set from storage slimey:main long
execute store result score $seed.hi slimey.data run data get entity @s background
#int32 (hi*m) mod 2^32 + carry
scoreboard players operation $seed.hi slimey.data += $carry slimey.data
#mask hi to 16 for 48 bit total
scoreboard players operation $seed.hi slimey.data %= #65536 slimey.data

## GETS LO PART OF PRODUCT
### Combination of double precision loss and long-ints being clamped instead of overflowing means we have to do some trickery to recapture the lost ten bits.
#(lo*M_lo >> 10) loses 10 bits which is inevitable double precision loss anyways, recover via + (lo mod 2^10 * mlo)mod2^10 which is the lost ten bits.
#int32 (lo mod 2^10 * M_lo) mod 2^10 gets the lost 10 bits
scoreboard players operation $temp slimey.data = $seed.lo slimey.data
scoreboard players operation $temp slimey.data %= #1024 slimey.data
execute store result storage slimey:main long long 3740067437 run scoreboard players get $temp slimey.data
data modify entity @s background set from storage slimey:main long
execute store result score $carry slimey.data run data get entity @s background
scoreboard players operation $carry slimey.data %= #1024 slimey.data

#(long) lo*m >> 4 keeps it below the wrap bullshit but loses 10 bits(from the stupid fucking double precision loss) bottom bits
execute store result storage slimey:main long long 1575931494.8125 run scoreboard players get $seed.lo slimey.data
#int32 mod 2^32 the shifted value to get lo with 10 bottom bits lost
data modify entity @s background set from storage slimey:main long
execute store result score $seed.lo slimey.data run data get entity @s background
#bitshift value << 4 to make space for carry
scoreboard players operation $seed.lo slimey.data *= #16 slimey.data
#add lost bits to lo to fully recover
scoreboard players operation $seed.lo slimey.data += $carry slimey.data
#lo + 11 w/ propagating carry
execute if score $seed.lo slimey.data matches -10..-1 run scoreboard players add $seed.hi slimey.data 1
scoreboard players add $seed.lo slimey.data 11
######


##FINAL OUTPUT >>> 31
#lo >>> (LOGICAL SHIFT) 17
function slimey:rshift_log
#hi << 15
scoreboard players operation $seed.hi slimey.data *= #32768 slimey.data
#output = 31 bits (hi << 15 + lo >>> 17)
execute store result score $output slimey.data run scoreboard players operation $seed.hi slimey.data += $seed.lo slimey.data
#if mod10 = 0 then hurrah
scoreboard players operation $output slimey.data %= #10 slimey.data
kill @s