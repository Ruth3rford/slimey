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
function seed:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.A",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo .data = $temp .data

# + VAL B
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.B .data
function seed:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.B",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo .data = $temp .data

# + VAL C
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.C .data
function seed:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.C",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo .data = $temp .data

# + VAL D (hi and lo)
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data += $val.D_lo .data
function seed:borcar {NEWNUM:"$temp",OLDNUM:"$seed.lo",ADDEND:"$val.D_lo",OUTPUT:"$seed.hi"}
scoreboard players operation $seed.lo .data = $temp .data
scoreboard players operation $seed.hi .data += $val.D_hi .data
###

### XOR WITH 0x3ad8025f
#XOR lower 32 bits with 0x3ad8025f
scoreboard players operation $A .data = $seed.lo .data 
scoreboard players set $B .data 987234911
scoreboard players operation $output .data = $A .data
scoreboard players operation $output .data += $B .data

# AND calculation:
scoreboard players reset $and .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players set $and .data -2147483648

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1073741824

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 536870912

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 268435456

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 134217728

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 67108864

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 33554432

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16777216

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8388608

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4194304

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2097152

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1048576

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 524288

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 262144

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 131072

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 65536

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32768

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16384

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8192

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4096

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2048

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1024

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 512

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 256

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 128

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 64

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1
# (End of AND calculation)

scoreboard players operation $output .data -= $and .data
scoreboard players operation $output .data -= $and .data

### CORRECT SO FAR

### XOR WITH LCG CONSTANT AND MASK TO 48
#XOR whole number with multiplier constant and then mod 16 the his to mask to 48 bit

#XOR lower bits with (Mlo 2s complement)
scoreboard players operation $A .data = $output .data
scoreboard players set $B .data -554899859
scoreboard players operation $output .data = $A .data
scoreboard players operation $output .data += $B .data

# AND calculation:
scoreboard players reset $and .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players set $and .data -2147483648

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1073741824

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 536870912

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 268435456

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 134217728

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 67108864

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 33554432

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16777216

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8388608

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4194304

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2097152

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1048576

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 524288

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 262144

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 131072

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 65536

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32768

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16384

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8192

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4096

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2048

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1024

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 512

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 256

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 128

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 64

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1
# (End of AND calculation)

scoreboard players operation $output .data -= $and .data
scoreboard players operation $output .data -= $and .data
scoreboard players operation $seed.lo .data = $output .data
#XOR with the His
scoreboard players operation $A .data = $seed.hi .data
scoreboard players set $B .data 5
scoreboard players operation $output .data = $A .data
scoreboard players operation $output .data += $B .data

# AND calculation:
scoreboard players reset $and .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players set $and .data -2147483648

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1073741824

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 536870912

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 268435456

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 134217728

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 67108864

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 33554432

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16777216

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8388608

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4194304

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2097152

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1048576

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 524288

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 262144

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 131072

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 65536

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32768

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16384

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8192

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4096

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2048

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1024

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 512

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 256

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 128

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 64

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 32

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 16

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 8

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 4

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 2

scoreboard players operation $A .data *= #2 .data
scoreboard players operation $B .data *= #2 .data
execute if score $A .data matches ..-1 if score $B .data matches ..-1 run scoreboard players add $and .data 1
# (End of AND calculation)

scoreboard players operation $output .data -= $and .data
scoreboard players operation $output .data -= $and .data
#mod 16 to mask to 48
scoreboard players operation $output .data %= #65536 .data
scoreboard players operation $seed.hi .data = $output .data
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
scoreboard players operation $carry .data = $seed.lo .data
#>>> 16 to find upper 16 bits (breaking it down into unsigned ints)
function seed:uint_upper_16 {target:"$carry"}
#get prodhi mod 16 << 16
execute store result storage seed:main long long 25214903917 run scoreboard players get $carry .data
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $A .data run data get block 0 0 0 SuccessCount
scoreboard players operation $A .data %= #65536 .data
scoreboard players operation $A .data *= #65536 .data
#(hi16 of lo * m >> 16) mod 2^32
execute store result storage seed:main long long 384748.9001007080078125 run scoreboard players get $carry .data
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $carry .data run data get block 0 0 0 SuccessCount
#get lower 16 bits of lo
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data %= #65536 .data

#get prodlo mod 2^32
execute store result storage seed:main long long 25214903917 run scoreboard players get $temp .data
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $B .data run data get block 0 0 0 SuccessCount

#sum prodhi mod 16 << 16 + prodlo mod2^32 if they overflow then add one
scoreboard players operation $A .data += $B .data
execute if score $A .data matches 1.. run scoreboard players operation $A .data /= #65536 .data
execute if score $B .data matches 1.. run scoreboard players operation $B .data /= #65536 .data
execute if score $A .data matches ..-1 run function seed:uint_upper_16 {target:"$A"}
execute if score $B .data matches ..-1 run function seed:uint_upper_16 {target:"$B"}
execute if score $A .data < $B .data run scoreboard players add $carry .data 1

# Lo16 of lo * M >> 32
execute store result storage seed:main long long 5.87080230866558849811553955078125 run scoreboard players get $temp .data
#safely under 32 bits so dont need to mod
execute store result score $temp .data run data get storage seed:main long 1
scoreboard players operation $carry .data += $temp .data
###

## GETS HI PART + CARRY
#(long) Hi*M
execute store result storage seed:main long long 25214903917 run scoreboard players get $seed.hi .data
#int32 (hi*m)mod 2^32 = preserved hi bits ignoring overflow
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $seed.hi .data run data get block 0 0 0 SuccessCount
#int32 (hi*m) mod 2^32 + carry
scoreboard players operation $seed.hi .data += $carry .data
#mask hi to 16 for 48 bit total
scoreboard players operation $seed.hi .data %= #65536 .data

## GETS LO PART OF PRODUCT
### Combination of double precision loss and long-ints being clamped instead of overflowing means we have to do some trickery to recapture the lost ten bits.
#(lo*M_lo >> 10) loses 10 bits which is inevitable double precision loss anyways, recover via + (lo mod 2^10 * mlo)mod2^10 which is the lost ten bits.
#int32 (lo mod 2^10 * M_lo) mod 2^10 gets the lost 10 bits
scoreboard players operation $temp .data = $seed.lo .data
scoreboard players operation $temp .data %= #1024 .data
execute store result storage seed:main long long 3740067437 run scoreboard players get $temp .data
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $carry .data run data get block 0 0 0 SuccessCount
scoreboard players operation $carry .data %= #1024 .data

#(long) lo*m >> 4 keeps it below the wrap bullshit but loses 10 bits(from the stupid fucking double precision loss) bottom bits
execute store result storage seed:main long long 1575931494.8125 run scoreboard players get $seed.lo .data
#int32 mod 2^32 the shifted value to get lo with 10 bottom bits lost
data modify block 0 0 0 SuccessCount set from storage seed:main long
execute store result score $seed.lo .data run data get block 0 0 0 SuccessCount
#bitshift value << 4 to make space for carry
scoreboard players operation $seed.lo .data *= #16 .data
#add lost bits to lo to fully recover
scoreboard players operation $seed.lo .data += $carry .data
#lo + 11 w/ propagating carry
execute if score $seed.lo .data matches -10..-1 run scoreboard players add $seed.hi .data 1
scoreboard players add $seed.lo .data 11
######


##FINAL OUTPUT >>> 31
#lo >>> (LOGICAL SHIFT) 17
function seed:rshift_log
#hi << 15
scoreboard players operation $seed.hi .data *= #32768 .data
#output = 31 bits (hi << 15 + lo >>> 17)
execute store result score $output .data run scoreboard players operation $seed.hi .data += $seed.lo .data
#if mod10 = 0 then hurrah
scoreboard players operation $output .data %= #10 .data
execute if score $output .data matches 0 run return 1
return fail