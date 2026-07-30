// 1. Get the active camera's top-left position
var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);

// 2. Define the fixed screen offset (30 pixels from the border)
var _offset_x = 30;
var _offset_y = 30;

// 3. Lock the object to the camera position plus the offset
x = _cam_x + _offset_x;
y = _cam_y + _offset_y;
