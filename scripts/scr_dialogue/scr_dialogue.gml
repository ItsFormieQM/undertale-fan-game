function scr_dialogue(){
	_dialogue_type = global.msc
	for (var i = 0; i < 1024; i++) {
		global.msg[i] = pointer_null
	}
	switch (_dialogue_type) {
		case "save_ruins_entrance":
			global.msg[0] = "* You wonder what this is."
			global.msg[1] = "* You looked around."
			global.msg[2] = "* You found it beautiful..."
			global.msg[3] = "* Progress saved..."
			break
		case "0.0":
			global.msg[0] = "* Undefined shit son"
			break
	}
}