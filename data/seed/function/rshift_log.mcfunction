execute if score $seed.lo .data matches 1.. run return run scoreboard players operation $seed.lo .data /= #131072 .data
scoreboard players add $seed.lo .data 2147483647
scoreboard players add $seed.lo .data 1
scoreboard players operation $seed.lo .data /= #131072 .data
scoreboard players add $seed.lo .data 16384