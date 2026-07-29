if global.hp <= 0 && ran == 0 {
	global.hp = 0
	instance_create_layer(0,0,"BATTLE",obj_gameover_controller)
	show_debug_message("dead")
	global.title_card = true
	global.died = true
	ran = 1
}
else if global.im_hurt == true && ran == 0 {
	ran = 1
	global.title_card = true
	alarm[0] = 180
}
