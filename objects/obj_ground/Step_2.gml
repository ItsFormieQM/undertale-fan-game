if !place_meeting(x,y,obj_soulbattle) {
	ran = 0
}
if ran == 0 && place_meeting(x,y - 0.5,obj_soulbattle) {
	obj_soulbattle.y -= 2
	ran = 1
	i++
	show_debug_message("ohyes" + string(i))
}

