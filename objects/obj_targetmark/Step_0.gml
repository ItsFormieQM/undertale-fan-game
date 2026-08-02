if !place_meeting(x,y,obj_battle_border) {
	image_alpha -= 0.25
	if image_alpha <= 0 {
		
		instance_destroy()
	}
}