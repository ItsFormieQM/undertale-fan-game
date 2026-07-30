visible = false
scr_play_snd(snd_shatter, 1.75, false)
instance_create_layer((x - 2), y, "BATTLE", obj_heartshards);
instance_create_layer(x, (y + 3), "BATTLE", obj_heartshards);
instance_create_layer((x + 2), (y + 6), "BATTLE", obj_heartshards);
instance_create_layer((x + 8), y, "BATTLE", obj_heartshards);
instance_create_layer((x + 10), (y + 3), "BATTLE", obj_heartshards);
instance_create_layer((x + 12), (y + 6), "BATTLE", obj_heartshards);
alarm[2] = 90