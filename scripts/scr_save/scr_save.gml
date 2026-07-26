function scr_save(_instance){
    // 1. Open the file and store the handle ID
    var _file = file_text_open_write("savedata.txt");
    
    var save_x = _instance.x;
    var save_y = _instance.y;
    var _curr_mus = global.current_song;
    
    // Store variables as strings to ensure matching formatting in the hash calculation
    var _str_x    = string(save_x);
    var _str_y    = string(save_y);
    var _str_mus  = audio_get_name(_curr_mus);
    var _str_room = room_get_name(room);
    var _str_lv   = string(global.lv);
    
    // Line 1: Write player X position
    file_text_write_string(_file, _str_x); 
    file_text_writeln(_file);
    
    // Line 2: Write player Y position
    file_text_write_string(_file, _str_y);
    file_text_writeln(_file);
    
    // Line 3: Write music asset name
    file_text_write_string(_file, _str_mus); 
    file_text_writeln(_file);
	
    // Line 4: Write room asset name
    file_text_write_string(_file, _str_room); 
    file_text_writeln(_file);
	
	// Line 5: Write lv
	file_text_write_string(_file, _str_lv); 
    file_text_writeln(_file);
	
	// Line 6: Genocide Status
	file_text_write_string(_file, string(global.genocide_route)); 
    file_text_writeln(_file);
	
	file_text_write_string(_file, string(global.autorun)); 
    file_text_writeln(_file);
    
    // Line 7: Create the validation hash using identical data ordering as scr_load
    var _secret_salt = "sub to tung tung sahur";
    var _combined_string = _str_x + _str_y + _str_mus + _str_room + _str_lv + _secret_salt;
    var _hash = md5_string_utf8(_combined_string);
    
    file_text_write_string(_file, _hash);
    
    // 2. CRITICAL: Close the file first so windows saves the data!
    file_text_close(_file);
    
    // 3. Playtest location printing
    if (global.debug == true) {
	    show_debug_message("=== PLAYTEST SAVE LOCATION ===");
	    show_debug_message(game_save_id);
	    show_debug_message("==============================");
	}

    show_debug_message("SAVED WITH ANTICHEAT HASH");
    obj_savepoint.shallsave = false;
}
