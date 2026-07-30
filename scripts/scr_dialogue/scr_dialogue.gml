function scr_dialogue(){
	_dialogue_type = global.msc
	for (var i = 0; i < 1024; i++) {
		global.msg[i] = pointer_null
	}
	switch (_dialogue_type) {
		case "save_ruins_entrance":
			global.typer_snd = snd_txt1
			global.sndtxt_delay = 2.78// in frames
			global.msg[0] = "* You wonder what this is."
			global.msg[1] = "* You looked around."
			global.msg[2] = "* You found it beautiful..."
			global.msg[3] = "* Progress saved..."
			break
		case "tip_ruins1":
			global.typer_snd = snd_txt1
			global.sndtxt_delay = 2.78// in frames
			global.msg[0] = "* Only the fearless may \n  proceed."
			global.msg[1] = "* Brave ones, foolish ones."
			global.msg[2] = "* Both walk not the middle \n  road."
			break
		case "0.0":
			global.typer_snd = snd_txt1
			global.sndtxt_delay = 2.85
			global.msg[0] = "* Undefined shit son"
			break
	}
}