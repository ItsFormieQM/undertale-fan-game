scr_dialogue()
global.gamepad_id = -1;
for (var i = 0; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        global.gamepad_id = i;
        break; 
    }
}
if global.osflavor == "Mobile" {
	game_set_speed(60,gamespeed_fps)
}