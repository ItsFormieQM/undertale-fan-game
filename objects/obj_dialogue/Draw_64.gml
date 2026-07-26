var _oldcol = draw_get_colour()
var _oldfont = draw_get_font()
draw_set_font(fnt_main)
draw_set_colour(c_white)
draw_text(175 - 45, 318, global.msg[0])
if global.msg[1] != noone {
	draw_text(175 - 45, 318 + 30, global.msg[1])
}

draw_set_colour(_oldcol)
draw_set_font(_oldfont)

