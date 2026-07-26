// 1. Find the active camera viewport (usually camera 0)
var _cam = view_camera[0];

// 2. Get the current X and Y position of the camera in the room
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);

// 3. Pin the object to its fixed offset positions relative to the camera
// Replace 100 and 200 with the exact spacing values you want
x = _cam_x + 161;
y = _cam_y + 190;
