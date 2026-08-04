global.l_held = 0
global.osflavor = 0
global.sp = 0.85
global.canmove = true
global.is_fs = false
global.interacted = 0
global.msg = [];
global.current_song = 0
global.enctimer = 0
global.debug = false
global.interacted_c = 0
global.spdex = 1
global.l_click = 0
global.interacted_x = 0
global.lv = 1
global.hp = 20
global.maxhp = global.hp
global.max_hp = global.maxhp
global.atk = 10
global.def = 10
global.xp = 0
global.genocide_route = 0
global.frame_rate = 60 // might go unused 
global.item = []
global.current_mus_vol = 0
global.msc = "0.0"
touch_x = 0
touch_y = 0
global.is_nx = false
global.gamepad_id = -1
global.autorun = false
global.show_solids = false
global.is_fs = false
global.no_mus = false
global.typer_snd = snd_txt1
global.sndtxt_delay = 1
global.frozen = false
global.door = []
global.battle_mus = 0
global.battle_vol = 0
global.battle_msg = []
global.soulmode = "red"
scr_ifnintendo()
if os_type == os_windows || os_type == os_linux || os_type == os_macosx {
	global.osflavor = "PC"
}
if global.osflavor == "Mobile" || os_type == os_android || os_type == os_ios{
	global.osflavor = "Mobile"
	
}
global.ismoving = false



// 1. Initialize an empty array at game launch
global.warplist = [];
global.door = []

// 2. Push warp data into the array one after another
// Slot [0]
// Pre-allocate slots 0, 1, and 2 immediately at boot with empty fallbacks
for (var i = 0; i < 1024; i++) {
    global.warplist[i] = pointer_null;
	global.msg[i] = pointer_null;
	global.door[i] = pointer_null
	global.battle_msg[i] = pointer_null
}
for (var i = 0; i < array_length(global.item); i++) {
	global.item[i] = pointer_null
}
audio_channel_num(1024); 

/* enums 
	item_monstercandy - start at 0
	item_friedpipis_ph
	item_toastedbun
	item_annoyingdog
	item_memories
	item_hopesanddreams
*/
for (var i = 0; i < 30; i++) {
	global.item[i] = "used"
}

global.item[0] = "item_monstercandy"
global.item[1] = pointer_null
global.item[2] = "item_toastedbun"
global.item[3] = "item_annoyingdog"
global.item[4] = "item_memories"
global.item[5] = "item_hopesanddreams"
global.item[6] = pointer_null
global.item[7] = pointer_null
irannow = 0
room_goto_next()
scr_get_itemlist()
global.typer_snd_b = 0
global.enemy_name = []
global.enemy_inst = []
global.enemy_hp = []
for (var i = 0; i < 4; i++) {
	global.enemy_name[i] = "cohort"
	global.enemy_inst[i] = pointer_null
	global.enemy_hp[i] = 0
} 
global.enemy_part1 = []
global.enemy_part2 = []
for (var i = 0; i < 4; i++) {
	global.enemy_part1[i] = pointer_null
	global.enemy_part2[i] = pointer_null
} 
global.prev_room = 0
global.save_point_convo = 0
global.no_bg = 0
global.custom_bg = 0
global.txtchange_genocide = 0
global.always_miss = 0
global.check_dialogue_type = 0
global.check_dialogue = []
global.bconvo = []
global.bfont = fnt_main
for (var i = 0; i < 32; i++) {
	global.check_dialogue[i] = 0
}
global.sndtxt_delay = 0
global.txt_delay = 0
global.battle_convo_amnt = 0
global.amount_of_pages_to_be_seen_battle = 0
global.typer_snd_convob = 0
global.sndtxt_delay_convob = 0
global.can_move_soul = false



