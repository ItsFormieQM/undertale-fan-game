function scr_genocide_init(){
	if global.genocide_route == 1 {
		global.sp = 1.5
		if instance_exists(obj_mainchara)
			obj_mainchara.image_speed = 2
	}
}