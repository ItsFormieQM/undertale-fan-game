
if room != room_battle && room > room_buffer {
	ran = 0
	_accountx = camera_get_view_x(view_camera[0])
	_accounty = camera_get_view_y(view_camera[0])

	obj_battle_marker.x = _accountx + 25
	obj_battle_marker.y = _accounty + 230
}


