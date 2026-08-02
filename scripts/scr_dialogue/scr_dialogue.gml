function scr_dialogue(){
	_dialogue_type = global.msc
	for (var i = 0; i < 512; i++) {
		global.msg[i] = pointer_null
	}
	switch (_dialogue_type) {
		case "chara_talk0":
			if global.genocide_route == 1 {
				global.typer_snd = snd_txt2
				global.sndtxt_delay = 2.78// in frames
				global.msg[0] = "* Kris where are you \n  going?!"
				global.msg[1] = "* That's the wrong way \n  idiot."
				global.msg[2] = "* Head up and not down..."
				global.msg[3] = "* ..."
				global.msg[4] = "* Why are you just standing \n  there?!"
				global.msg[5] = "* GO UP!"
			}
			break
		case "save_ruins_entrance":
			if global.genocide_route == 0 {
				global.typer_snd = snd_txt1
				global.sndtxt_delay = 2.78// in frames
				global.msg[0] = "* You wonder what this is."
				global.msg[1] = "* You looked around."
				global.msg[2] = "* You found it beautiful..."
				global.msg[3] = "* Progress saved..."
			}
			#region GENOCIDE TALK
			if room > room_buffer && room != room_battle {
				if global.genocide_route == 1 && global.save_point_convo == 1 {
					global.typer_snd = snd_txt2
					global.sndtxt_delay = 2.78// in frames
					global.msg[0] = "* Are you sure that you \n  want to proceed?"
					global.msg[1] = "* Hmm..."
					global.msg[2] = "* Interesting..."
					global.msg[3] = "* Go ahead Kris..."
					global.msg[4] = "* I will be waiting for you \n  at the end of the \n  UNDERGROUND..."
					global.msg[5] = "* You better not disappoint \n  me..."
				}
				else if global.genocide_route == 1 && global.save_point_convo >= 2 {
					global.typer_snd = snd_txt2
					global.sndtxt_delay = 2.78// in frames
					global.msg[0] = "* Proceed"
				
				}
			}
			#endregion
			
			break
		case "tip_ruins1":
			if global.genocide_route == 0 {
				global.typer_snd = snd_txt1
				global.sndtxt_delay = 2.78// in frames
				global.msg[0] = "* Only the fearless may \n  proceed."
				global.msg[1] = "* Brave ones, foolish ones."
				global.msg[2] = "* Both walk not the middle \n  road."
			}
			else if global.genocide_route == 1 {
				global.typer_snd = snd_txt2
				global.sndtxt_delay = 2.78// in frames
				global.msg[0] = "* Kris, don't get \n  distracted..."
				global.msg[1] = "* Just ignore everything \n  and Proceed..."
			}
			break
		case "0.0":
			global.typer_snd = snd_txt1
			global.sndtxt_delay = 2.85
			global.msg[0] = "* Undefined shit son"
			break
	}
}