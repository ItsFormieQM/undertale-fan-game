instance_destroy(obj_enemymarker)
if !instance_exists(obj_battle_convo_writer) {
	instance_create_layer(self.x + 110,self.y + 20, "SUBCHARA",obj_battle_convo_writer)
}