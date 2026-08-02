//switch sprite_index {
//	case spr_blcon:
//		self.x = global.enemy_inst.x + 110
//		self.y = global.enemy_inst.y + 20
//		break
//	case spr_blcon_shrt:
//		self.x = global.enemy_inst.x + 180
//		self.y = global.enemy_inst.y - 30
//		break
//}
if global.interacted == 1 {
	global.interacted = 0 
	global.next_msg_convo_bt += 1
	char_index = 0
	global.battle_convo_amnt += 1
	global.remainder_of_convo += 1
	ran = 0
}