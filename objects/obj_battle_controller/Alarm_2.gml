
global.interacted_x = 1
var inst = global.enemy_inst
inst.was_hit = 0
inst.shake_timer = 25
inst.ran = 0
global.l_click = 0
obj_heartbattle_fr.x = 48
obj_heartbattle_fr.y = 452
box = 0
obj_act.image_index = 0
obj_fight.image_index = 1
instance_destroy(obj_targetb)
instance_destroy(obj_targetmark)
obj_heartbattle_fr.abouttofight = 0	
attacked = 0
atk_ran = 0
atk_timer = 0
resize = 0
obj_heartbattle_fr.isoccupied = 0
obj_heartbattle_fr.box = 0
obj_heartbattle_fr.abouttocheck = 0
startattacking = 0
instance_create_layer(0,0,"SUBCHARA",obj_battle_writer)
damage_calc_done = 0
attempted_fight = 0