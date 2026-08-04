if place_meeting(x,y,obj_battle_cleanup) {
	instance_destroy() // REQUIRED SO THERES NO MEMORY LEAKS
	//obj_bone_controller.i += 1
	//show_debug_message("CLEANED: " + string(obj_bone_controller.i))
}
if !place_meeting(x - 2,y,obj_battle_border) {
	instance_destroy() // REQUIRED SO THERES NO MEMORY LEAKS
	//obj_bone_controller.i += 1
	//show_debug_message("CLEANED: " + string(obj_bone_controller.i))
}
event_inherited()