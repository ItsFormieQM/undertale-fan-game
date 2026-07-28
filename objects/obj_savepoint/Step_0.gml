var _offset = 20;

if (global.interacted == 1) && global.canmove == true {
    // Check if the main character is close enough in any direction
    if (distance_to_object(obj_mainchara) <= _offset) {
        
        show_debug_message("save?");
		global.msc = _message_counter
        
        // Find the nearest save mark and trigger the save script
        var _id = instance_nearest(x, y, obj_savemark);
        if (instance_exists(_id)) && shallsave == true{
            scr_save(_id);
        }
		
		if !instance_exists(obj_dialogue){
			instance_create_layer(0,0,"TECHNICAL",obj_dialogue)
		}
    }
}
