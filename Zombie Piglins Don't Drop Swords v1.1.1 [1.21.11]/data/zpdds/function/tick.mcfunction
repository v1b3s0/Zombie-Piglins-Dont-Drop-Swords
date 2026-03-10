# 1.21.11 requires non-negative drop chances. 0.0f disables equipment drops.
execute as @e[type=minecraft:zombified_piglin] run data modify entity @s drop_chances.mainhand set value 0.0f
