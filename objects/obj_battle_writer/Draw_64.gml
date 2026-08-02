var _text_battle = global.battle_msg[global.next_msg]
var _str_length = string_length(_text_battle)

var _check_text = global.check_dialogue[0]
var _check_str_length = string_length(_check_text)

var _oldcol = draw_get_colour()
var _oldfnt = draw_get_font()
draw_set_font(fnt_main)

if obj_heartbattle_fr.writeforcheckk == 0{
	if char_index < string_length(_text_battle) {
	
		timer_normal++
		timer_snd++
		if timer_snd >= global.sndtxt_delay {
			scr_play_snd(global.typer_snd_b,1, false)
			timer_snd = 0
		
		}
		if timer_normal >= 1.7 {
			visible_txt = string_copy(_text_battle,1,char_index)
			char_index++
			timer_normal = 0
		}
	}
	else {
		if extras == 1 {
			visible_txt = string_copy(_text_battle,1,char_index)
			extras = 0
		}
	
	}
}
else {
	if char_index < string_length(_check_text) {
	
		timer_normal++
		timer_snd++
		if timer_snd >= global.sndtxt_delay {
			scr_play_snd(global.typer_snd_b,1, false)
			timer_snd = 0
		
		}
		if timer_normal >= 1.7 {
			visible_txt = string_copy(_check_text,1,char_index)
			char_index++
			timer_normal = 0
		}
	}
	else {
		if extras == 1 {
			visible_txt = string_copy(_check_text,1,char_index)
			extras = 0
		}
	
	}
}
draw_text(60,272.5, visible_txt)

draw_set_colour(_oldcol)
draw_set_font(_oldfnt)