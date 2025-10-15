$data modify storage seed:main seed set value $(seed)l
execute store result score $seed.hi .data run data get storage seed:main seed 0.00000000023283064365386962890625
execute store result score $seed.lo .data run seed