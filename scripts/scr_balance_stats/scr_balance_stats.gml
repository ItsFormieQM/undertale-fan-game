function scr_balance_stats(){
	global.hp = (global.lv == 20) ? 99 : 16 + (4 * global.lv);
	global.maxhp = global.hp
}