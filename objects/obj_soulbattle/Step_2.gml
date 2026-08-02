#region SOUL MODES
if ran == 0 {
	switch global.soulmode {
		case "red":
			sprite_index = spr_heart_big
			ran = 1
			break
		case "blue":
			sprite_index = spr_heart_bigblue
			_soulmode = "blue"
			ran = 1
			break
	}
}
#endregion
if global.canmove {
	if _soulmode == "red" {
		#region WASD && FOR RED SOUL
		if global.w_held && !place_meeting(x,y - 1,obj_borderline){
			y -= _sp	
		}
		if global.s_held && !place_meeting(x,y + 1,obj_borderline) && !place_meeting(x,y + 1, obj_ground){
			y += _sp
		}
		if global.d_held && !place_meeting(x + 1,y,obj_borderline){
			x += _sp
		}
		if global.a_held && !place_meeting(x - 1,y,obj_borderline){
			x -= _sp
		}
		#endregion
	}
	if _soulmode == "blue" {
		var _delay = 40
		if global.w_released {
			blue_timer = 50
		}
		if place_meeting(x,y + 2,obj_ground) {
			vspeed = 0
			gravity = 0
			blue_timer = 0
			if initial_blue == 1 {
				y -= 0.1
				initial_blue = 2
			}
		}
		if initial_blue == 0 {
			blue_timer = _delay
			initial_blue = 1
		}
		if !place_meeting(x,y + 1, obj_ground) && (!global.w_held|| blue_timer >= _delay) {
			gravity = global.bluesoul_gravity
			blue_timer = 50
		}
		
		if global.w_held && blue_timer < _delay{
			blue_timer++
			y -= _sp
			initial_blue = 1
		}
		//if keyboard_check(ord("S")) && !place_meeting(x,y + 1,obj_borderline) && !place_meeting(x,y + 1, obj_ground){
		//	y += _sp
		//}
		if global.d_held && !place_meeting(x + 1,y,obj_borderline){
			x += _sp
		}
		if global.a_held && !place_meeting(x - 1,y,obj_borderline){
			x -= _sp
		}
	}
}
//for (var i)