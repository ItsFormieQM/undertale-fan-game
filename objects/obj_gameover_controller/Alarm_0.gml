//obj_mainchara.x = -666
//obj_mainchara.y = -666
instance_create_layer(obj_mainchara.x,obj_mainchara.y,"TECHNICAL",obj_blackscreen)
instance_create_layer(obj_mainchara.x, obj_mainchara.y, "BATTLE", obj_heartbattle)
obj_heartbattle.dead = 1

