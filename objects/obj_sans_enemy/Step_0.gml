if obj_battle_controller.attked == 1 {
	attacked = 1
}
if attacked == 1 && global.always_miss {
	if ran == 0 {
		
		instance_create_layer(self.x,self.y,"TECHNICAL",obj_enemymarker)
		ran = 1
		show_debug_message("ATTACK COUNTER: "+ string(attack_counter))
	}
	timer++
	if timer < 30 {
		x -= 4.5
	}
	else if timer == 30 {
		if !instance_exists(obj_miss) {
			instance_create_layer(obj_enemymarker.x,obj_enemymarker.y,"SUBCHARA",obj_miss)
		}
	}
	else if timer >= 65 && timer < 95 {
		x += 4.5
	}
	else if timer >= 95 {
		
		self.x = obj_enemymarker.x
		timer = 0
		attacked = 0
		if ran == 1 {
			attack_counter++
			
		}
		ran = 0
		alarm[0] = 5
	}
	
}

if obj_battle_controller.currently_fighting == 1 && obj_battle_controller.startattacking == 1 {
	if bullet_calc == 0 {
		if !instance_exists(obj_bone_main) {
			instance_create_layer(0,0,"TECHNICAL",obj_bone_main)
		}
		bullet_calc = 1
	}
}
else {
	bullet_calc = 0
	instance_destroy(obj_bone_main)
}



#region MESSY AHH DIALOGUE CODE
if attack_counter >= 1 && attack_counter < 99 {
	if instance_exists(obj_battle_convo_writer) {
		obj_battle_convo_writer.sprite_index = spr_blcon_shrt
		obj_battle_convo_writer.x = global.enemy_inst.x + 180
		obj_battle_convo_writer.y = global.enemy_inst.y - 30
	}
}
if global.battle_convo_amnt >= 2 && attack_counter == 1 {
	instance_destroy(obj_battle_convo_writer)
}
else if global.battle_convo_amnt >= 1 && attack_counter == 2 {
	instance_destroy(obj_battle_convo_writer)
}
else if global.battle_convo_amnt >= 1 && attack_counter == 3 {
	instance_destroy(obj_battle_convo_writer)
}
else if global.battle_convo_amnt >= 1 && attack_counter == 4 {
	instance_destroy(obj_battle_convo_writer)
}
else if global.battle_convo_amnt >= 2 && attack_counter == 5 {
	instance_destroy(obj_battle_convo_writer)
}
else if global.battle_convo_amnt >= 1 && attack_counter > 5 {
	instance_destroy(obj_battle_convo_writer)
}
#endregion