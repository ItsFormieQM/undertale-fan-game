global.sp = 2
global.spdex = 0.85
if global.autorun == true || keyboard_check(ord("X")){
	global.sp = 2.5;
    global.spdex = 1.5;
	show_debug_message("fast asf")
}
if global.gamepad_id != -1 && gamepad_button_check(global.gamepad_id, gp_face3) {
	global.sp = 2.5;
    global.spdex = 1.5;
	show_debug_message("fast asf")
}
