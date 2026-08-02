function scr_create_enemy(){
	switch string(global.battlegroup) {
		case "Froggit":
			instance_create_layer(240, 190, "Enemies",obj_froggit_enemy)
			instance_create_layer(240,163.5, "Enemies", obj_froggit_head_en)
			instance_create_layer(240,220, "Enemies", obj_froggit_torso_en)
			global.enemy_inst = obj_froggit_enemy
			global.enemy_part1[0] = obj_froggit_head_en
			global.enemy_part2[0] = obj_froggit_torso_en
			global.enemy_hp[0] = 40
			show_debug_message("ran")
			break
		case "Sans":
			
			instance_create_layer(317,194,"Enemies",obj_sans_torso)
			instance_create_layer(317,194, "SUBCHARA", obj_sans_head)
			instance_create_layer(317, 100, "Enemies",obj_sans_enemy)
			global.enemy_hp[0] = 1
			global.enemy_inst = obj_sans_enemy
			global.enemy_part1[0] = obj_sans_head
			global.enemy_part2[0] = obj_sans_torso
			show_debug_message("ur cooked son")
			break
		default:
			scr_overworld_damage(999) // trolling lol
			break
	}
}