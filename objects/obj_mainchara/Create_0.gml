ran = 0
// FIX 1: Remove the room restriction so buttons exist in ALL areas on mobile
if (global.osflavor == "Mobile") {
    
    // Check if the instances are already created to prevent infinite loops
    if (!instance_exists(obj_a_button) && !instance_exists(obj_x_button) && !instance_exists(obj_y_button)) {
        
        // FIX 2: Use display_get_gui_width/height to position them relative to the screen bounds 
        // instead of hardcoded room canvas positions
        var _gui_w = display_get_gui_width();
        var _gui_h = display_get_gui_height();
        
        // Position them nicely relative to the device glass viewport bounds
        // Position them smoothly relative to each other so they do not overlap
		var _inst_a = instance_create_layer(450, 420, "Instances", obj_a_button);
		var _inst_x = instance_create_layer(510, 340, "Instances", obj_x_button); // Shipped higher on the Y axis
		var _inst_y = instance_create_layer(570, 420, "Instances", obj_y_button); // Shipped further right on the X axis

        
        // FIX 3: Target the returned instance variables directly 
        // to prevent object scope reference errors
        _inst_a.image_xscale = 2;
        _inst_a.image_yscale = 2;
        
        _inst_x.image_xscale = 2;
        _inst_x.image_yscale = 2;
        
        _inst_y.image_xscale = 2;
        _inst_y.image_yscale = 2;
    }
}
