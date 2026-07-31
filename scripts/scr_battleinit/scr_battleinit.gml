function scr_battleinit(_battlegroup){
	switch _battlegroup {
		case "froggit_solo":
			global.battle_mus = mus_nbattle
			global.battle_vol = 1.25
			global.battlegroup = "Froggit"
			break
		case "toriel_dreemurr":
			exit // wip
	}
}