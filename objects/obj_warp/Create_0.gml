warpto = 0
activated = false
// 1. By default, assign this marker to slot 0
warp_slot_id = 0;
//transition_room = false
_my_target = 0
// 2. We use a quick Alarm loop to wait 1 frame 
// This ensures any Instance Creation Code modifications have time to load!
alarm[0] = 1;
global.room_trans = _room_trans

