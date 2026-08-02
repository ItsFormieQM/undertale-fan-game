

if global.hp == global.max_hp {
	image_index = 11
}
else {
	image_index = round(global.hp / (global.max_hp / 10))
}
//show_debug_message(image_index)