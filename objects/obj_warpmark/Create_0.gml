// Fallback if not set in creation code
if (!variable_instance_exists(id, "warp_slot_id")) {
    warp_slot_id = 0; 
}

// Register instantly during creation so the room code can read it safely
global.warplist[warp_slot_id] = id;
//if global.debug == true {
//	visible = true
//}