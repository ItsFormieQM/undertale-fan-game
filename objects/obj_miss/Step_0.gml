timer++ 
if timer >= 15 {
	gravity = 0
	vspeed = 0
}
if timer >= 60 {
	instance_destroy()
}