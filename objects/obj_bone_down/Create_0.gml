speed = 3
randomize_bones = 0
self_gamble = obj_bone_main._gamble
event_inherited()
switch self_gamble {
	case 1:
		image_blend = make_colour_rgb(0, 162, 232)
		_isblue = true
		break
	default:
		_isblue = false
		break
}


