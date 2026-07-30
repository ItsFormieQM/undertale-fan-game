timer++ 

if global.frame_rate == 60 {
	if image_alpha < 1 {
		image_alpha += 0.1
	}

	if timer >= 30 {
		image_alpha -= 0.15
		if image_alpha <= 0 {
			instance_destroy()
		}
	}

}

else if global.frame_rate == 120 {
	if image_alpha < 1 {
		image_alpha += 0.1 / 3
	}

	if timer >= 60 {
		image_alpha -= 0.15 / 3
		if image_alpha <= 0 {
			instance_destroy()
		}
	}
}
else if global.frame_rate == 30 {
	if image_alpha < 1 {
		image_alpha += 0.1 * 2
	}

	if timer >= 15 {
		image_alpha -= 0.15 * 2
		if image_alpha <= 0 {
			instance_destroy()
		}
	}

}