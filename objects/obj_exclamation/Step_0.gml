timer++;
image_xscale = -0.95;

// Frame 25: Spawn battle objects
if (timer == 25) {
    var _inst_heart = instance_create_layer(obj_mainchara.x, obj_mainchara.y, "BATTLE", obj_heartbattle);
    var _inst_flash = instance_create_layer(obj_mainchara.x, obj_mainchara.y, "TECHNICAL", obj_flashblack);
    _inst_heart.image_index = 0;
    _inst_flash.image_index = 0;
}

// Frame 26: First flash and noise
if (timer == 26) {
    audio_play_sound(snd_noise, 67, false);
    obj_heartbattle.image_index = 0;
    obj_flashblack.image_index = 1;
}

// Frame 34 (26 + 8): Second flash
if (timer == 34) {
    audio_play_sound(snd_noise, 67, false);
    obj_heartbattle.image_index = 1;
    obj_flashblack.image_index = 0;
}

// Frame 42 (26 + 16): Final flash and battle music start
if (timer == 42) {
    audio_stop_all();
    audio_play_sound(snd_noise, 67, false);
    audio_play_sound(snd_bstart, 67, false);
    obj_heartbattle.image_index = 0;
    obj_flashblack.image_index = 1;
}

// Frame 43+: Move heart to the UI box/test area
if (timer >= 43) {
    if (instance_exists(obj_flashblack)) {
        obj_flashblack.image_index = 0;
    }
    
    if (instance_exists(obj_heartbattle) && instance_exists(obj_fight)) {
        with (obj_heartbattle) {
            move_towards_point(obj_fight.x, obj_fight.y, 3.25);
            
            // If heart reaches the target box
            if (place_meeting(x, y, obj_fight)) {
    // 1. Stop movement immediately so it doesn't keep gliding in the new room
			    speed = 0;
    
			    // 2. Calculate and snap its position to the camera view BEFORE switching rooms
			    x = obj_fight.x - camera_get_view_x(view_camera[0]);
			    y = obj_fight.y - camera_get_view_y(view_camera[0]);
				obj_fight.x = obj_fight.x - camera_get_view_x(view_camera[0]);
			    obj_fight.y = obj_fight.y - camera_get_view_y(view_camera[0]);
    
			    // 3. Clear overworld variables and clean up instances
			    global.enctimer = 0;
			    instance_destroy(obj_mainchara);
			    instance_destroy(obj_exclamation);
    
			    // 4. Change rooms LAST (GameMaker will carry the persistent heart to the new x/y)
			    room_goto(room_battle);
			}

        }
    }
}
