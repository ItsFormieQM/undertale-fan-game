if _room != -1 && ran == 0{
	
	alarm[0] = 59
	ran = 1
}
if !instance_exists(obj_fader) {
	instance_destroy(self)
}