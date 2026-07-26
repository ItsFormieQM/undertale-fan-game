timer++ 

if image_alpha < 1 {
	image_alpha += 0.1
}
if timer >= 30 {
	image_alpha -= 0.15
	if image_alpha <= 0 {
		instance_destroy()
	}
}