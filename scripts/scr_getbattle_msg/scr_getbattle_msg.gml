function scr_getbattle_msg(){
	for (var i = 0; i < 257; i++) {
		global.battle_msg[i] = pointer_null
	}
	switch global.battlegroup {
		case "Froggit":
			if global.genocide_route == 0 {
				global.max_bmsg = 10 // max message till loop
				global.fallback_bmsg = 2 // what index should we loop in
				global.battle_msg[0] = "* Froggit stumbles their way in!"
				global.battle_msg[1] = "* Froggit questions their \n  existence..."
				global.battle_msg[2] = "* Froggit regretted stumbling \n  in here."
				global.battle_msg[3] = "* Froggit is confused as to why \n  they're here in the first place."
				global.battle_msg[4] = "* Froggit stood there, croaking..."
				global.battle_msg[5] = "* Froggit croaks loudly..."
				global.battle_msg[6] = "* Froggit is showing signs of being \n  tired."
				global.battle_msg[7] = "* Froggit is confused as to why \n  they're here in the first \n  place."
				global.battle_msg[8] = "* Froggit questions their \n  existence..."
				global.battle_msg[9] = "* Froggit regretted stumbling \n  in here."
				global.battle_msg[10] = "* Froggit is confused as to why \n  they're here in the first \n  place."
			
				global.typer_snd_b = snd_txt2
			}
			else if global.genocide_route == 1 {
				global.typer_snd_b = snd_txt2
				global.max_bmsg = 0 
				global.fallback_bmsg = 0
				global.battle_msg[0] = "* Proceed"
			}
			break
		case "Sans":
			global.max_bmsg = 10 // max message till loop
			global.fallback_bmsg = 2 // what index should we loop in
			global.battle_msg[0] = "* It's just sans..."
			global.battle_msg[1] = "* Just keep attacking..."
			global.battle_msg[2] = "* Don't give up Kris..."
			global.battle_msg[3] = "* You can defeat this fraud..."
			global.battle_msg[4] = "* Keep attacking..."
			global.max_bmsg = 4
			global.typer_snd_b = snd_txt2
			break
		default:
			global.typer_snd = snd_txt2
			global.sndtxt_delay = 2.7
			global.battle_msg[0] = "* Undefined battle group son"
			break
	}
}