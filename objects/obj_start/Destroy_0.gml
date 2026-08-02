if (variable_global_exists("target_x") && global.target_x != undefined) {
    obj_mainchara.x = global.target_x;
    obj_mainchara.y = global.target_y;
    
    // Clear the globals so they don't trigger on normal room changes
    global.target_x = undefined;
    global.target_y = undefined;
}

if !file_exists("savedata.txt") {
	audio_stop_all()
	global.current_song = 0
	scr_tempsave()
}
if instance_exists(obj_battlemarker) {
	obj_mainchara.x = obj_battlemarker.x
	obj_mainchara.y = obj_battlemarker.y
	instance_destroy(obj_battlemarker)
}