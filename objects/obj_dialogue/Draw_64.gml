var _oldcol = draw_get_colour();
var _oldfont = draw_get_font();



// Safety check for null/empty messages
if (global.msg[i] == pointer_null) {
    instance_destroy();
    exit; // Stop drawing if destroyed
}

var _text = global.msg[i];
var _msg_len = string_length(_text);

draw_set_font(fnt_main);
draw_set_colour(c_white);
if ran == 0 {
	char_index = 0;  
	ran = 1
	
}
// type shit - had to use a tutorial
if (char_index < _msg_len) {
    timer++;
	typer_timer++
	if typer_timer >= global.sndtxt_delay { // for snd effects
		scr_play_snd(global.typer_snd, 1.25, false)
		typer_timer = 0
	}
    if (global.interacted_x == 1) { // if z press
        char_index = _msg_len; 
        _visible_text = _text;
        timer = 0;
        global.interacted_x = 0;
    } 
    else if (timer >= 1.7) {
        char_index++;
        _visible_text = string_copy(_text, 1, char_index);
        timer = 0;
    }
    
    draw_text(175 - 55, 318, _visible_text);
}
else if (char_index >= _msg_len) {
    draw_text(175 - 55, 318, _text);
    typer_timer = global.sndtxt_delay
    if (global.interacted == 1) {
        i++;
        char_index = 0;
        timer = 0;
        global.interacted = 0;
    }
}

// restore
draw_set_colour(_oldcol);
draw_set_font(_oldfont);