
if global.interacted == 1 && con == 0 {
	global.msg[0] = "* You looked around..."
	global.msg[1] = noone
	global.interacted = 0
	con = 1
}
else if global.interacted == 1 && con == 1 {
	global.msg[0] = "* You saw how beautiful "
	global.msg[1] = "  it is..."
	global.interacted = 0
	con = 2
	
}
else if global.interacted == 1 && con == 2 {
	global.msg[0] = "* Progress Saved..."
	global.msg[1] = noone
	global.interacted = 0
	con = 3
	obj_savepoint.shallsave = true
}
else if global.interacted == 1 && con == 3 {
	instance_destroy()
	global.interacted = 0
}

