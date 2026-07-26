// 1. Fetch the active camera assigned to viewport 0
var _cam = view_camera[0];

// 2. Get the camera's resolution dimensions
var _cam_w = camera_get_view_width(_cam);
var _cam_h = camera_get_view_height(_cam);

// 3. Calculate where the camera needs to go to center on the player
var _target_x = x - (_cam_w / 2);
var _target_y = y - (_cam_h / 2);

// 4. Clean Edge Clamping: Keep the camera strictly inside the room grid
_target_x = clamp(_target_x, 0, room_width - _cam_w);
_target_y = clamp(_target_y, 0, room_height - _cam_h);
//global.interacted = 0
//global.interacted_c = 0
//global.interacted_x = 0
// 5. Apply the finalized position to the camera view bounds
camera_set_view_pos(_cam, _target_x, _target_y);
scr_genocide_init()

global.l_held = 0
