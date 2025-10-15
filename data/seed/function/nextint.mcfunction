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
execute if score $output .data matches 0 run return run say slime chunk!
say not slime chunk :(