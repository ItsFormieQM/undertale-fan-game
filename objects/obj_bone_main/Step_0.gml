timer++

if timer >= 36 {
	timer = 0
	switch _gamble {
		case 0:
			instance_create_layer(228,385,"BULLETS",obj_bone_down)
			obj_bone_down.image_xscale = 1.2
			obj_bone_down.image_yscale = 2.1
			instance_create_layer(228,382,"BULLETS",obj_bone_top)
			obj_bone_top.image_xscale = 1.2
			obj_bone_top.image_yscale = 2.1
	
			instance_create_layer(410,385,"BULLETS",obj_bone_down_reverse)
			obj_bone_down_reverse.image_xscale = 1.2
			obj_bone_down_reverse.image_yscale = 2.1
			instance_create_layer(410,382,"BULLETS",obj_bone_top_reverse)
			obj_bone_top_reverse.image_xscale = 1.2
			obj_bone_top_reverse.image_yscale = 2.1
	}
}