function scr_checkdialogue(){
	for (var i = 0; i < 1; i++) {
		global.check_dialogue[i] = 0
	}
	switch global.check_dialogue_type {
		case "Sans":
			global.check_dialogue[0] = "* Sans - 1 HP \n* The weakest enemy... \n* Just keep attacking I guess?"
			break
		case "Froggit":
			global.check_dialogue[0] = "* Froggit - 40 HP \n* Life's miserable for them... \n* Maybe try mystifying them?"
			if global.genocide_route == 1 {
				global.check_dialogue[0] = "* Froggit - 40 HP \n* Waste of time..."
			}
			break
		default:
			global.check_dialogue[0] = "So I haveth a laser \n  pointere..."
			break
	}
}