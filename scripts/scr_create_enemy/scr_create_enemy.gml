function scr_create_enemy(){
	switch string(global.battlegroup) {
		case "Froggit":
			instance_create_layer(0, 0, "Instances",obj_froggit_enemy)
			instance_create_layer(240,240, "Instances", obj_froggit_head_en)
			instance_create_layer(240,290, "Instances", obj_froggit_torso_en)
			show_debug_message("ran")
			break
	}
}