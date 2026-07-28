function scr_load(){
    var _file_name = "savedata.txt";
    
    // 1. Safety check
    if (!file_exists(_file_name)) {
        show_debug_message("Warning: No savedata.txt file found.");
        return false;
    }
    
    // 2. Open the file for READING
    var _file = file_text_open_read(_file_name);
    
    // Line 1: Read X Coordinate
    var _loaded_x = file_text_read_string(_file); 
    file_text_readln(_file); 
    
    // Line 2: Read Y Coordinate
    var _loaded_y = file_text_read_string(_file); 
    file_text_readln(_file);
    
    // Line 3: Read Audio Asset Name
    var _loaded_mus = string_trim(file_text_read_string(_file)); 
    file_text_readln(_file);
	
    // Line 4: Read Room Asset Name
    var _loaded_room = string_trim(file_text_read_string(_file)); 
    file_text_readln(_file);
    
    // Line 5: Read LV Stat
    var _loaded_lv = file_text_read_string(_file);
    file_text_readln(_file); // Advance to line 6
	
	// Line 6: Set Genocide Status
	global.genocide_route = bool(file_text_read_string(_file))
    file_text_readln(_file);
	
	global.autorun = bool(file_text_read_string(_file))
    file_text_readln(_file);
	
	var _is_fs = 0
	_is_fs = bool(file_text_read_string(_file))
	global.is_fs = _is_fs
    file_text_readln(_file);
	window_set_fullscreen(_is_fs)
	var _fps
	_fps = string(file_text_read_string(_file))
	
	file_text_readln(_file);
	game_set_speed(_fps, gamespeed_fps)
	
	global.no_mus = bool(file_text_read_string(_file))
    file_text_readln(_file);
    
    // Line 7: Read Saved Anti-Cheat Hash
    var _saved_hash = string_trim(file_text_read_string(_file));
    
    // 3. Close the file handle immediately after reading ALL variables
    file_text_close(_file);
    
    // 4. Verification Check: Recombine loaded variables with a secret password
    var _secret_salt = "sub to tung tung sahur";
    var _check_string = string(_loaded_x) + string(_loaded_y) + _loaded_mus + _loaded_room + string(_loaded_lv) + _secret_salt;
    var _calculated_hash = md5_string_utf8(_check_string);
    
    // 5. Flip variable based on verification results
    if (_saved_hash != _calculated_hash) {
        global.file_tampered = true;
        show_message("Tampering detected!");
    } else {
        global.file_tampered = false;
        show_debug_message("File is clean.");
    }
    
    // 6. Convert room string to an asset index and move rooms
    var _room_asset = asset_get_index(_loaded_room);
    if (_room_asset != -1 && asset_get_type(_loaded_room) == asset_room) {
        room_goto(_room_asset);
    } else {
        show_debug_message("LOAD ERROR: Room asset not found: " + string(_loaded_room));
        return false;
    }
    
    // 7. Pass data to game state variables
    global.target_x = real(_loaded_x);
    global.target_y = real(_loaded_y);
    global.lv = real(_loaded_lv);
    
    // 8. Automatically recalculate Undertale Max HP based on the loaded LV
    global.max_hp = (global.lv == 20) ? 99 : 16 + (4 * global.lv);
    global.hp = global.max_hp; 
    
    // 9. Convert the music text name back into an actual sound asset
    var _music_asset = asset_get_index(_loaded_mus);
    if (audio_exists(_music_asset)) {
        global.current_song = _music_asset;
        if (!audio_is_playing(global.current_song)) {
            audio_stop_all();
            audio_play_sound(global.current_song, 67, true);
        }
    }
    scr_genocide_init()
    exit;
}
