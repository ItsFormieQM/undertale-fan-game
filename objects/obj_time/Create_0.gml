global.l_held = 0
global.osflavor = 0
global.sp = 0.85
global.canmove = true
global.is_fs = false
global.interacted = 0
global.msg = [];
global.current_song = 0
global.enctimer = 0
global.debug = true
global.interacted_c = 0
global.spdex = 1
global.l_click = 0
global.interacted_x = 0
global.lv = 11
global.hp = 20
global.maxhp = global.hp
global.max_hp = global.maxhp
global.atk = 10
global.def = 10
global.xp = 0
global.genocide_route = 0
touch_x = 0
touch_y = 0
global.is_nx = false
global.gamepad_id = -1
global.autorun = false
global.show_solids = false
global.is_fs = false
scr_ifnintendo()
if os_type == os_windows || os_type == os_linux || os_type == os_macosx {
	global.osflavor = "PC"
}
if global.osflavor == "Mobile" || os_type == os_android || os_type == os_ios{
	global.osflavor = "Mobile"
	
}


room_goto_next()
// 1. Initialize an empty array at game launch
global.warplist = [];

// 2. Push warp data into the array one after another
// Slot [0]
// Pre-allocate slots 0, 1, and 2 immediately at boot with empty fallbacks
for (var i = 0; i < 1024; i++) {
    global.warplist[i] = pointer_null;
	global.msg[i] = pointer_null;
}
audio_channel_num(1024); 




