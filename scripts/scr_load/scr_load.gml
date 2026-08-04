function scr_load(){
	
	if instance_exists(obj_blackscreen) {
		instance_destroy(obj_blackscreen)
	}
	global.died = false
	global.l_held = 0
	global.osflavor = 0
	global.sp = 0.85
	global.canmove = true
	global.is_fs = false
	global.interacted = 0
	global.msg = [];
	global.current_song = 0
	global.enctimer = 0
	//global.debug = true
	global.interacted_c = 0
	global.spdex = 1
	global.l_click = 0
	global.interacted_x = 0
	global.lv = 1
	global.hp = 20
	global.maxhp = global.hp
	global.max_hp = global.maxhp
	global.atk = 10
	global.def = 10
	global.xp = 0
	global.genocide_route = 0
	global.frame_rate = 60 // might go unused 
	global.item = []
	global.msc = "0.0"
	touch_x = 0
	touch_y = 0
	global.is_nx = false
	global.gamepad_id = -1
	global.autorun = false
	global.show_solids = false
	global.is_fs = false
	global.no_mus = false
	global.typer_snd = snd_txt1
	global.sndtxt_delay = 1
	global.frozen = false
	global.door = []

	scr_ifnintendo()
	if os_type == os_windows || os_type == os_linux || os_type == os_macosx {
		global.osflavor = "PC"
	}
	if global.osflavor == "Mobile" || os_type == os_android || os_type == os_ios{
		global.osflavor = "Mobile"
	
	}


	room_goto_next()
	// 1. Initialize an empty array at game launch
	global.warplist = [];
	global.door = []

	// 2. Push warp data into the array one after another
	// Slot [0]
	// Pre-allocate slots 0, 1, and 2 immediately at boot with empty fallbacks
	for (var i = 0; i < 1024; i++) {
	    global.warplist[i] = pointer_null;
		global.msg[i] = pointer_null;
		global.door[i] = pointer_null
	}
	for (var i = 0; i < array_length(global.item); i++) {
		global.item[i] = pointer_null
	}
	audio_channel_num(1024); 

	/* enums 
		item_monstercandy - start at 0
		item_friedpipis_ph
		item_toastedbun
		item_annoyingdog
		item_memories
		item_hopesanddreams
	*/
	for (var i = 0; i < 30; i++) {
		global.item[i] = "used"
	}

	global.item[0] = "item_monstercandy"
	global.item[1] = pointer_null
	global.item[2] = "item_toastedbun"
	global.item[3] = "item_annoyingdog"
	global.item[4] = "item_memories"
	global.item[5] = "item_hopesanddreams"
	global.item[6] = pointer_null
	global.item[7] = pointer_null
	irannow = 0

	scr_get_itemlist()

    var _file_name = "savedata.txt";
    
    // 1. Safety check
    if (!file_exists(_file_name)) {
        show_debug_message("Warning: No savedata.txt file found.");
        return false;
    }
    global.canmove = true
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
	global.genocide_route = real(file_text_read_string(_file))
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
		show_debug_message("TAMPERED FILE.");
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
    audio_stop_all();
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
        
        scr_start_music(global.current_song, 1.25, true)
    }
    scr_genocide_init()
	global.title_card = false
	global.died = false
	obj_invincibilty_controller.ran = 0
	
    exit;
}
