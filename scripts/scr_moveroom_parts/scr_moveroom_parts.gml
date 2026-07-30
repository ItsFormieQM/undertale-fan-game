function scr_moveroom_parts(_target_room){
	if !instance_exists(obj_room_manager) {
		instance_create_layer(0,0,"TECHNICAL",obj_room_manager)
		obj_room_manager._room = _target_room
	}
}