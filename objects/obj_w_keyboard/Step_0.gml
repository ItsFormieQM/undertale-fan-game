if global.l_held == 1 {
	if position_meeting(mouse_x,mouse_y,self)  {
		show_debug_message("W")
		global.w_held = true
	}
}
event_inherited()