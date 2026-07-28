// Inherit the parent event


if global.debug == true {
	visible = true
}
else {
	visible = false
}

if place_meeting(x,y,obj_mainchara) {
	if global.interacted == 1 {
		show_debug_message("SHIT?")
		global.msc = _message_type
		global.interacted = 0
		instance_create_layer(0,0,"TECHNICAL",obj_dialogue)
	}
}