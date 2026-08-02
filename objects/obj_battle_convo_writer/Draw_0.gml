draw_self()
var _oldfnt = draw_get_font()
var _oldcol = draw_get_colour()
if ran == 0 {
	_convo = global.bconvo[global.next_msg_convo_bt] 
	ran = 1
}
var _convo_length = string_length(_convo)

draw_set_font(global.bfont)
draw_set_colour(c_black)
if startdrawing == 1 {
	
	

	extras = 0
	if char_index < _convo_length {
		timer_snd++
		timer_txt++
		
		
		if timer_txt >= global.txt_delay {
			
			char_index++
			timer_txt = 0
			i++
			visible_txt = string_copy(_convo,1,char_index)
		}
		
		if timer_snd >= global.sndtxt_delay_convob {
			scr_play_snd(global.typer_snd_convob, 1.15)
			timer_snd = 0
		}
	}
	
	else {
		if extras == 0 {
			extras = 1 
			visible_txt = string_copy(_convo,1,char_index)
			i++
			
		}
	}
}

switch sprite_index{
	case spr_blcon:
		draw_text(self.x - 40,self.y - 47.5,string(visible_txt))
		break
	case spr_blcon_shrt:
		draw_text(self.x - 82.5,self.y - 47.5,string(visible_txt))
		break
}
draw_set_font(_oldfnt)
draw_set_colour(_oldcol)
