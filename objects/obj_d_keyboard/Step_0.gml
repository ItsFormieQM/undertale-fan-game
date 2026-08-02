if global.l_held == 1 {
	if position_meeting(mouse_x,mouse_y,self)  {
		show_debug_message("D")
		global.d_held = true
	}
}
event_inherited()