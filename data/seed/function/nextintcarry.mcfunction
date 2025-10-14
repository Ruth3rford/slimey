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

#sum prodhi mod 16 << 16 + prodlo mod2^32 if they overflow/underflow then add one/remove one
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



