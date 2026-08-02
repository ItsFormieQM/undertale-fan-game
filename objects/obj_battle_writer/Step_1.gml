if global.battle_msg[global.next_msg] == pointer_null {
	global.next_msg = global.fallback_bmsg
	show_debug_message("RESET")
}