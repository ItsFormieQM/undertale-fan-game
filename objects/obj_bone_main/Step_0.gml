timer++
for (var i = 0; i < 6; i++) {
	delay[i] = 999
}


if attack_counter % 2 == 1 {
	delay[0] = 70
	if timer == (delay[0] / 2) {
		_gamble = 0
		var down_bone = instance_create_layer(228,385,"BULLETS",obj_bone_down)
		down_bone.image_xscale = 1.2
		down_bone.image_yscale = 2.1
		down_bone.speed = 4.5	
			
		var top_bone = instance_create_layer(228,382,"BULLETS",obj_bone_top)
		top_bone.image_xscale = 1.2
		top_bone.image_yscale = 2.1
		top_bone.speed = 4.5
		
	}
	else if timer >= delay[0] {

		_gamble = 1
		var down_bone = instance_create_layer(228,385,"BULLETS",obj_bone_down)
		down_bone.image_xscale = 1.2
		down_bone.image_yscale = 2.1
			
		var top_bone = instance_create_layer(228,382 - 63,"BULLETS",obj_bone_top)
		top_bone.image_xscale = 1.2
		top_bone.image_yscale = 11
		timer = 0
	}
}
else {
	delay[0] = 35
	if timer >= delay[0] {
		_gamble = 0
		
		var down_bone = instance_create_layer(228,385,"BULLETS",obj_bone_down)
		down_bone.image_xscale = 1.2
		down_bone.image_yscale = 2.1
		
		var top_bone = instance_create_layer(228,382,"BULLETS",obj_bone_top)
		top_bone.image_xscale = 1.2
		top_bone.image_yscale = 2.1
								
		var top_bone_reverse = instance_create_layer(410,382,"BULLETS",obj_bone_top_reverse)
		top_bone_reverse.image_xscale = 1.2
		top_bone_reverse.image_yscale = 2.1
		
		var down_bone_reverse = instance_create_layer(410,385,"BULLETS",obj_bone_down_reverse)
		down_bone_reverse.image_xscale = 1.2
		down_bone_reverse.image_yscale = 2.1
		
		
		timer = 0
	}
}

//if timer >= delay {
//	timer = 0
//	switch _gamble {
//		case 0:
			
//			break
//		case 1:

			
			
//			//var top_bonen = instance_create_layer(228,382,"BULLETS",obj_bone_top)
//			//top_bonen.image_xscale = 1.2
//			//top_bonen.image_yscale =  2.1
			
			
//			//var top_bone1 = instance_create_layer(228,382,"BULLETS",obj_bone_top)
//			//top_bone1.image_xscale = 1.2
//			//top_bone1.image_yscale = 2.1
			
//			//var down_bone1 = instance_create_layer(228,385,"BULLETS",obj_bone_down)
//			//down_bone1.image_yscale = 2.1
//			//down_bone1.image_xscale = 1.2
//			//down_bone1.speed = 4
//			//down_bone1._gamble = 0
			
//			break
//			//instance_create_layer(410,385,"BULLETS",obj_bone_down_reverse)
//			//obj_bone_down_reverse.image_xscale = 1.2
//			//obj_bone_down_reverse.image_yscale = 2.1
//			//instance_create_layer(410,382,"BULLETS",obj_bone_top_reverse)
//			//obj_bone_top_reverse.image_xscale = 1.2
//			//obj_bone_top_reverse.image_yscale = 2.1
			
//	}
//}