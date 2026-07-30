function scr_overworld_damage(_damage){
	
	if global.title_card == false && global.im_hurt == false {
		global.hp -= _damage
		global.damage_took = _damage
		scr_play_snd(snd_damaged, 1, false)
		global.im_hurt = true
		global.title_card = true
	}
	
}