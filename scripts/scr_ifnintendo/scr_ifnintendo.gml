function scr_ifnintendo(){
	// Check if running on Android
	
	    var _info = os_get_info();
    
	    if (ds_exists(_info, ds_type_map)) {
	        // Retrieve device details
	        var _manufacturer = _info[? "MANUFACTURER"]; // e.g., "Nintendo"
	        var _model        = _info[? "MODEL"];        // e.g., "Nintendo Switch"
	        var _device       = _info[? "DEVICE"];       // e.g., "icosa" or "nx"
	        var _product      = _info[? "PRODUCT"];      // e.g., "icosa"
        
	        show_debug_message("Manufacturer: " + string(_manufacturer));
	        show_debug_message("Model: " + string(_model));
	        show_debug_message("Device Name: " + string(_device));
			if string(_manufacturer) == "Nintendo" {
				global.is_nx = true
			}
	    }
		
		
}