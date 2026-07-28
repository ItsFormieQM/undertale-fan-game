if global.door[door_number] == true {
	instance_destroy(_self)
}
if place_meeting(obj_warp.x,obj_warp.y,_self) {
	instance_deactivate_object(obj_warp)
}
else {
	instance_activate_object(obj_warp)
}