key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))

enum states {
	idle,
	walk,
	aim
}

arm = -1

states = states.idle

movespeed = 4

sprite_index = s_player_whole