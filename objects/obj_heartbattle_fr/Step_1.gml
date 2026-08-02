global.a_pressed = keyboard_check_pressed(ord("A"))
global.d_pressed = keyboard_check_pressed(ord("D"))

switch global.soulmode {
	case "red":
		sprite_index = spr_heart_big_fake
		break
	case "blue":
		sprite_index = spr_heart_bigblue_fake
		break
	default:
		break
}