function scr_damage_battle(_dmg_amnt, _karma = false){
	if !global.title_card && !_karma {
		global.hp -= _dmg_amnt
		global.title_card = true
		obj_battle_controller.alarm[3] = 90
		scr_play_snd(snd_damaged_mainchara, 1.25)
	}
	else if _karma {
		global.hp -= _dmg_amnt
		if !audio_is_playing(snd_damaged_mainchara) {
			scr_play_snd(snd_damaged_mainchara, 0.9)
		}
	}
}