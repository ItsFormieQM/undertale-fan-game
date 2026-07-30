if !instance_exists(obj_blackscreen) && global.died == false {
	
	if near_harm == 1 {
		if !instance_exists(obj_blackscreen_notgo) {
			show_debug_message("yep it broke");
		}
		
		if image_alpha < 1 {
			image_alpha += 0.1;
			// FIX: Use with() to safely update all instances without causing crashes
			with (obj_blackscreen_notgo) {
				image_alpha += 0.1 / 2;
			}
		}
		else if image_alpha >= 1 {
			image_alpha = 1;
			with (obj_blackscreen_notgo) {
				image_alpha = 0.5;
			}
		}
	}
	else if near_harm == 0 {
		if image_alpha > 0 {
			image_alpha -= 0.1;
			with (obj_blackscreen_notgo) {
				image_alpha -= 0.1 / 2;
			}
			show_debug_message("ran = 3");
		}
		else if image_alpha <= 0 {
			image_alpha = 0;
			// FIX: Force the target object's alpha to 0 so it stops flashing/ghosting
			with (obj_blackscreen_notgo) {
				image_alpha = 0;
			}
		}
	}
}
else if instance_exists(obj_blackscreen) && global.died == true {
	image_alpha = 0;	
	
	if instance_exists(obj_blackscreen_notgo) {
		instance_destroy(obj_blackscreen_notgo);
	}
	
	show_debug_message("ran = 5");
}
