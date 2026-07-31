if global.osflavor == "PC" || global.osflavor == "Mobile" {
	#region Click Method PC OR MOBILE
	if global.l_click == 1 && box == 0{
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 203
		obj_fight.image_index = 0
		obj_act.image_index = 1
		box = 1
	}
	else if global.l_click == 1 && box == 1 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 362
		obj_act.image_index = 0
		obj_item.image_index = 1
		box = 2
	}
	else if global.l_click == 1 && box == 2 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 516
		obj_item.image_index = 0
		obj_spare.image_index = 1
		box = 3
	}
	else if global.l_click == 1 && box == 3 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 47
		box = 0
		obj_spare.image_index = 0
		obj_fight.image_index = 1
	}
	#endregion
	#region WASD (RIGHT) Method
	if keyboard_check_pressed(ord("D")) && box == 0{
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 203
		obj_fight.image_index = 0
		obj_act.image_index = 1
		box = 1
	}
	else if keyboard_check_pressed(ord("D")) && box == 1 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 362
		obj_act.image_index = 0
		obj_item.image_index = 1
		box = 2
	}
	else if keyboard_check_pressed(ord("D")) && box == 2 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 516
		obj_item.image_index = 0
		obj_spare.image_index = 1
		box = 3
	}
	else if keyboard_check_pressed(ord("D")) && box == 3 {
		scr_play_snd(snd_movemenu, 1.25)
		global.l_click = 0
		obj_heartbattle_fr.x = 47
		box = 0
		obj_spare.image_index = 0
		obj_fight.image_index = 1
	}
	#endregion
	#region WASD (LEFT) METHOD
	if keyboard_check_pressed(ord("A")) {
		if box == 0 {
			scr_play_snd(snd_movemenu, 1.25)
			global.l_click = 0
			obj_heartbattle_fr.x = 516
			obj_fight.image_index = 0
			obj_spare.image_index = 1
			box = 3
		}
		else if box == 1 {
			scr_play_snd(snd_movemenu, 1.25)
			global.l_click = 0
			obj_heartbattle_fr.x = 47
			box = 0
			obj_act.image_index = 0
			obj_fight.image_index = 1
		}
		else if box == 2 {
			scr_play_snd(snd_movemenu, 1.25)
			global.l_click = 0
			obj_heartbattle_fr.x = 203
			obj_item.image_index = 0
			obj_act.image_index = 1
			box = 1
		}
		else if box == 3 {
			scr_play_snd(snd_movemenu, 1.25)
			global.l_click = 0
			obj_heartbattle_fr.x = 362
			obj_spare.image_index = 0
			obj_item.image_index = 1
			box = 2
		}
		//else if box == 2 {
		//	scr_play_snd(snd_movemenu, 1.25)
		//	global.l_click = 0
		//	obj_heartbattle_fr.x = 516
		//	obj_item.image_index = 1
		//	obj_act.image_index = 0
		//	box = 3
		//}
		//else if box == 3 {
		//	scr_play_snd(snd_movemenu, 1.25)
		//	global.l_click = 0
		//	obj_heartbattle_fr.x = 362
		//	obj_act.image_index = 1
		//	obj_item.image_index = 0
		//	box = 2
		//}
	}
	
	#endregion
}