key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))

enum states {
	idle,
	walk,
	aim
}

arm0 = -1
arm1 = -1

states = states.idle

movespeed = 4

X = -1
Y = -1
bulletDrawTimer = -1

sprite_index = s_player_whole