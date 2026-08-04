if obj_battle_controller.miss == 1 {
	//show_debug_message("I FUCKING RAN")
	timer++
	if ran_1 == 0 {
		instance_create_layer(self.x,self.y,"TECHNICAL",obj_enemymarker)
		ran_1 = 1
	}
	if ran_1 = 1 {
		instance_create_layer(obj_enemymarker.x + 75,obj_enemymarker.y - 70,"Instances",obj_miss)
		ran_1 = 2
	}
	if timer < 30 {
		self.x -= 4
		path_end()
	}
	if timer >= 30 && timer < 60{
		self.x += 4
	}
	if timer >= 60 {
		self.x = obj_enemymarker.x
		timer = 0
		obj_froggit_head_en.alarm[2] = 1
		alarm[2] = 5
	}
	
}
if global.enemy_hp[0] <= 0 {
	path_end()	
	image_speed = 0
	shake_timer = 0
}
if global.battle_msg[0] == "* You Won!" {
	shake_timer = 50
	
	image_alpha = 0.5
	if calc == 0 {
		global.lv += irandom_range(0,2)
		calc = 1
	}
}
if obj_battle_controller.attempted_fight == 1 {
	obj_battle_controller.startattacking = 1
	global.can_move_soul = true
}