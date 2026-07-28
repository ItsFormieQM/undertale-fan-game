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

// --- State 1: Typing Out Message ---
if (char_index < _msg_len) {
    timer++;
    
    // Skip to the end of the current line instantly
    if (global.interacted_x == 1) {
        char_index = _msg_len;
        _visible_text = _text;
        timer = 0;
        global.interacted_x = 0;
    } 
    // Advance character on timer threshold
    else if (timer >= 1.7) {
        char_index++;
        _visible_text = string_copy(_text, 1, char_index);
        timer = 0;
    }
    
    draw_text(175 - 55, 318, _visible_text);
}
// --- State 2: Message Fully Displayed ---
else {
    draw_text(175 - 55, 318, _text);
    
    // Advance to next message index
    if (global.interacted == 1) {
        i++;
        char_index = 0;
        timer = 0;
        global.interacted = 0;
    }
}

// Restore old settings
draw_set_colour(_oldcol);
draw_set_font(_oldfont);