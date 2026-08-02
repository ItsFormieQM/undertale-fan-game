//show_debug_message(string(obj_battle_border.image_xscale))
#region ATTACK SEQUENCE

if attacked == 1 && atk_ran == 0 {
	instance_create_layer(321,327,"tempfight",obj_targetb)
	instance_create_layer(40,327,"tempfight2",obj_targetmark)
	atk_ran = 1
}
if damage_calc_done == 0 && atk_ran == 1 && instance_exists(obj_targetb){
	atk_timer++
	show_debug_message("ATTACK TIMER: " + string(atk_timer))
}
#endregion
#region ATTACK CALCULATION
if global.interacted == 1 && atk_ran == 1{
	obj_targetmark.speed = 0
	obj_targetmark.image_speed = 1
	scr_play_snd(snd_slash, 1.25)
	attked = 1
	instance_create_layer(global.enemy_inst.x,global.enemy_inst.y,"TECHNICAL", obj_slash)
	alarm[0] = 60
	
	if !global.always_miss {
		obj_heartbattle_fr.isfighting = 1
		if atk_timer < 18 && damage_calc_done == 0{
			global.enemy_damage_took = real(global.atk + round(irandom_range(global.atk / 2, sqrt(global.atk))))
			show_debug_message(global.enemy_damage_took)
			show_debug_message("RAN FROM CONDITION 1")
			damage_calc_done = 1
		}
		if (atk_timer > 18 && atk_timer < 36) && damage_calc_done == 0{
			global.enemy_damage_took = real(global.atk + round(irandom_range(global.atk * 2, sqrt(global.atk * 2))))
			show_debug_message(global.enemy_damage_took)
			show_debug_message("RAN FROM CONDITION 2")
			damage_calc_done = 1
		}
		if (atk_timer > 36 && atk_timer < 54) && damage_calc_done == 0{
			global.enemy_damage_took = real(global.atk + round(irandom_range(global.atk * 4, sqrt(global.atk * 4))))
			show_debug_message(global.enemy_damage_took)
			show_debug_message("RAN FROM CONDITION 3")
			damage_calc_done = 1
		}
		if (atk_timer > 54 && damage_calc_done == 0) || global.enemy_damage_took == 0{
			global.enemy_damage_took = 0
			miss = 1
			show_debug_message(global.enemy_damage_took)
			show_debug_message("MISS")
			damage_calc_done = 1
		}
	}
	else {
		global.enemy_damage_took = 0
		miss = 1
		show_debug_message(global.enemy_damage_took)
		show_debug_message("MISS")
		damage_calc_done = 1
	}
	attempted_fight = 1
	atk_ran = 2
	show_debug_message(global.enemy_damage_took)
}
#endregion
#region RESIZE STUFF
if resize == 1 {
	if obj_battle_border.image_xscale > 2.5 {
		obj_battle_border.image_xscale -= 0.18
		//obj_borderline.image_xscale -= 1
		if !instance_exists(obj_soulbattle) { 
			instance_create_layer(320,328,"MAINCHARA",obj_soulbattle)
			show_debug_message("spawned")
		}
	}
	else if obj_battle_border.image_xscale <= 2.5 {
		currently_fighting = 1
			
		resize = 0
	}
}
#endregion
#region FIGHT TIMER
if currently_fighting && !instance_exists(obj_battle_convo_writer) {
	startattacking = 1
}
if currently_fighting == 1 && startattacking == 1{
	currently_fighting_timer++
	if currently_fighting_timer >= 480 {
		instance_destroy(obj_soulbattle)
		if obj_battle_border.image_xscale < 7.60 {
			obj_battle_border.image_xscale += 0.18
			//obj_borderline.image_xscale += 1
		}
		else if obj_battle_border.image_xscale > 7.60 {
			currently_fighting = 0
			resize = 0
			alarm[2] = 1
			currently_fighting_timer = 0
			global.next_msg++
			damage_calc_done = 0
			miss = 0
		}
	}
}
#endregion
#region IF KILLED 
if global.enemy_hp[0] <= 0 {
	end_battle_violently = 1 
	if global.interacted == 1 {
		global.canmove = true
		global.interacted = 0
		room_goto(global.prev_room)
		obj_mainchara.visible = true
		scr_start_music(global.prev_song, 1.5,true)
	}
}
#endregion

