var _offset = 3
if (distance_to_object(obj_mainchara) <= _offset){
	scr_overworld_damage(8)
}

if distance_to_object(obj_mainchara) <= _offset * 10 {
	obj_harm_controller.near_harm = 1
}
else {
	obj_harm_controller.near_harm = 0
}