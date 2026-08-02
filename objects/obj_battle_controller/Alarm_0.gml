if miss == 0 {
	var inst = global.enemy_inst
	atk_timer = 0
	inst.was_hit = 1
	scr_play_snd(snd_damage, 1.25)
	global.enemy_hp[0] -= global.enemy_damage_took
	show_debug_message("ENEMY HP: "+string(global.enemy_hp[0]))
	alarm[1] = 50
}
else {
	
	alarm[1] = 50
	atk_timer = 0
	miss = 0
}
attked = 0