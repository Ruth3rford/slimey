scoreboard players set $init slimey.data 2
setblock 0 -64 0 command_block{Command:"seed",auto:1b,TrackOutput:1b} replace
schedule function slimey:init/get_seed 2t replace