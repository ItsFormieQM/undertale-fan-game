function scr_balance_stats(){
	global.max_hp = (global.lv == 20) ? 99 : 16 + (4 * global.lv);
	if global.lv >= 11  {
		global.genocide_route = 1
		global.atk = global.lv * 1.25
	}
	if global.max_hp >= 99 {
		global.max_hp = 99
		global.lv = 20
	}
}