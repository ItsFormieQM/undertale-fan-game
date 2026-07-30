var _offset = 100
if global.interacted == 1 {
	if (distance_to_object(obj_mainchara) <= _offset) && itran == 0{
	
			global.interacted = 0
			global.msc = _message_from
			instance_create_layer(0,0,"TECHNICAL",obj_dialogue)
			itran = 0
	
		show_debug_message("dont touch me ")
	}
}
if !instance_exists(obj_dialogue) && itran == 0 {
	itran = 1
}