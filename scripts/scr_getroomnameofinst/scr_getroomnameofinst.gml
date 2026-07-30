function scr_getroomnameofinst(_obj){
	var _room
	with (_obj) {
		_room = room_get_name(room)
	}
	
	switch _room {
		case room_ruin:
			return "Ruins - Entrance"
		default:
			return "NULL UNDEFINED"
	}
}