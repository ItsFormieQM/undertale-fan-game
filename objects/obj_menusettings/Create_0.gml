global.canmove = false
global.menumode = true
menu_first = 1
_accountx = camera_get_view_x(view_camera[0]);
_accounty = camera_get_view_y(view_camera[0]);
box = 0
opened_stat = 0
opened_stat = 0
opened_sett = 0
opened_sett_box = 1
opened_cell = 0
opened_cell_box = 0
opened_item = 0
opened_item_box = 0
can_change = 1
sel = 0
if global.frame_rate == 30 {
	sel = 2
}
else if global.frame_rate == 60 {
	sel = 0
}
else if global.frame_rate == 120 {
	sel = 1
}
//audio_play_sound(snd_noise,67,false)
instance_create_layer(_accountx + 32.5,_accounty + 99.5,"BATTLE", obj_menuheart)
scr_play_snd(snd_movemenu, 1.25, false)
obj_mainchara.image_index = 0
scr_balance_stats()
up_press = 0
down_press = 0