extends Node

# Keep elemental energy on warp
var warp_flag1: bool = false
# Each new dimension has 5 extra minutes
var warp_flag2: bool = false
# New dimensions have 3 resources
var warp_flag3: bool = false

# Learn defensive spells
var spell_flag1: bool = false
# Learn offensive spells
var spell_flag2: bool = false
# Spells cast in boss fight cost half as much
var spell_flag3: bool = false

# Unlocks advanced buildings
var prod_flag1: bool = false
# Efficient gremlins (half the time for output)
var prod_flag2: bool = false
# Efficient buildings (twice the output)
var prod_flag3: bool = false

func warp_1():
	return warp_flag1

func warp_2():
	return warp_flag2

func warp_3():
	return warp_flag3

func spell_1():
	return spell_flag1

func spell_2():
	return spell_flag2

func spell_3():
	return spell_flag3

func prod_1():
	return prod_flag1

func prod_2():
	return prod_flag2

func prod_3():
	return prod_flag3
