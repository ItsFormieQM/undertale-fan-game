if image_alpha < 1 && ran = 0{
	image_alpha += 0.009
	
}
else if image_alpha >= 1 && ran == 0{
	ran = 1
}
if ran == 1 {
	scr_start_music(snd_gameover, 1.5, true)
	 
	alarm[0] = 30
	ran = 2
}

if ran == 2 && proceed == 1 {
	if global.interacted == 1 {
		scr_load()
		show_debug_message("proceed")
	}
}
obj_harm_controller.near_harm = 0