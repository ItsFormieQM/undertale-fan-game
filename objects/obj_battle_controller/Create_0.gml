scr_start_music(global.battle_mus, global.battle_vol - 0.5, true)
scr_create_enemy()
scr_checkdialogue()
scr_midbattle_convo()
attacked = 0
atk_ran = 0
atk_timer = 0
global.enemy_damage_took = 0
resize = 0
timer = 0
currently_fighting = 0
currently_fighting_timer = 0
global.next_msg = 0
damage_calc_done = 0
miss = 0
_enemy_hp1 = real(global.enemy_hp[0])
end_battle_violently = 0
if global.no_bg {
	instance_destroy(obj_battlbg)
}
attked = 0
startattacking = 0
scr_midbattle_convo()
global.next_msg_convo_bt = 0
global.remainder_of_convo = 0
attempted_fight = 0