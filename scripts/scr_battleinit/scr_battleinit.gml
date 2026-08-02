function scr_battleinit(_battlegroup){
	switch _battlegroup {
		case "froggit_solo":
			global.soulmode = "red"
			global.bluesoul_gravity = 0.1
			global.enemy_name[0] = "Froggit"
			global.battle_mus = mus_nbattle
			global.battle_vol = 1.8
			global.battlegroup = "Froggit"
			global.no_bg = false
			global.always_miss = false
			global.check_dialogue_type = "Froggit"
			break
			
		case "sans":
			global.soulmode = "blue"
			global.bluesoul_gravity = 0.2
			global.no_bg = true
			global.battle_mus = mus_megalovania
			global.battle_vol = 1.25
			global.battlegroup = "Sans"
			global.enemy_name[0] = "Sans"
			global.always_miss = true
			global.check_dialogue_type = "Sans"
			break
		case "toriel_dreemurr":
			exit // wip
	}
}