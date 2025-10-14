### checks the unsigned his to see if there was a carry

#A = NEW NUM B = OLDNUM
scoreboard players operation $A .data = $temp .data
scoreboard players operation $B .data = $seed.lo .data
execute if score $A .data matches 1.. run scoreboard players operation $A .data /= #65536 .data
execute if score $B .data matches 1.. run scoreboard players operation $B .data /= #65536 .data
execute if score $A .data matches ..-1 run function seed:uint_upper_16 {target:"$A"}
execute if score $B .data matches ..-1 run function seed:uint_upper_16 {target:"$B"}
execute if score $A .data < $B .data run scoreboard players add $seed.hi .data 1