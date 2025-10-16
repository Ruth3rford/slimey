### checks the unsigned his to see if there was a carry/borrow

#A = NEW NUM B = OLDNUM
$scoreboard players operation $A slimey.data = $(NEWNUM) slimey.data
$scoreboard players operation $B slimey.data = $(OLDNUM) slimey.data
execute if score $A slimey.data matches 1.. run scoreboard players operation $A slimey.data /= #65536 slimey.data
execute if score $B slimey.data matches 1.. run scoreboard players operation $B slimey.data /= #65536 slimey.data
execute if score $A slimey.data matches ..-1 run function slimey:uint_upper_16 {target:"$A"}
execute if score $B slimey.data matches ..-1 run function slimey:uint_upper_16 {target:"$B"}
$execute if score $(ADDEND) slimey.data matches 1.. if score $A slimey.data < $B slimey.data run scoreboard players add $(OUTPUT) slimey.data 1
$execute if score $(ADDEND) slimey.data matches ..-1 if score $A slimey.data > $B slimey.data run scoreboard players remove $(OUTPUT) slimey.data 1