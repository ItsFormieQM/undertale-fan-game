timer++;
if (instance_exists(obj_heartbattle_actual)) {
    show_debug_message("still there");
}

// Frame 25: Spawn battle objects
if (timer == 25) {
    // FIX: Changed obj_heartbattle_actual to obj_heartbattle to match the rest of your code
    var _inst_heart = instance_create_layer(obj_mainchara.x, obj_mainchara.y, "BATTLE", obj_heartbattle_actual);
    var _inst_flash = instance_create_layer(obj_mainchara.x, obj_mainchara.y, "TECHNICAL", obj_flashblack);
    _inst_heart.image_index = 0;
    _inst_flash.image_index = 0;
}

// Frame 26: First flash and noise
if (timer == 26) {
    audio_play_sound(snd_noise, 67, false);
    if (instance_exists(obj_heartbattle)) obj_heartbattle_actual.image_index = 0;
    if (instance_exists(obj_flashblack))  obj_flashblack.image_index = 1;
}

// Frame 34 (26 + 8): Second flash
if (timer == 34) {
    audio_play_sound(snd_noise, 67, false);
    if (instance_exists(obj_heartbattle)) obj_heartbattle_actual.image_index = 1;
    if (instance_exists(obj_flashblack))  obj_flashblack.image_index = 0;
}

// Frame 42 (26 + 16): Final flash and setup BEFORE room change
if (timer == 42) {
    audio_stop_all();
    audio_play_sound(snd_noise, 67, false);
    audio_play_sound(snd_bstart, 67, false);
    
    if (instance_exists(obj_heartbattle)) obj_heartbattle_actual.image_index = 0;
    if (instance_exists(obj_flashblack))  obj_flashblack.image_index = 1 obj_flashblack.visible = false // Screen turns black here
    
    visible = false;
    room_goto(room_battle); 
}

// Frame 43+: We are now in room_battle. Move heart to the UI box/test area
if (timer >= 45) {
    // REMOVED: obj_flashblack.image_index = 0; (This was turning the flash off too early)
    
    if (instance_exists(obj_heartbattle_actual) && instance_exists(obj_fight)) {
        
        with (obj_heartbattle_actual) {
            // Glide toward the fight UI box button
            move_towards_point(obj_fight.x, obj_fight.y, 8); 
            
            // Check proximity or meeting to snap into place
            if (place_meeting(x, y, obj_fight) || point_distance(x, y, obj_fight.x, obj_fight.y) < 10) {
                speed = 0;
                
                // Snap exactly to the target box center/position
                x = obj_fight.x;
                y = obj_fight.y;
                
                global.enctimer = 0;
                
                // NEW: Turn off the black screen now that the heart has arrived
                if (instance_exists(obj_flashblack)) {
                    obj_flashblack.image_index = 0; 
					visible = false
                }
                
                // Destroy the overworld transition controller since the sequence is finished
                instance_destroy(other.id); 
            }
        }
    }
}


