draw_self()

var _oldcol = draw_get_colour()
var _oldfnt = draw_get_font()

if abouttofight == 1 {
	draw_set_font(fnt_main) 
	draw_text(100,267.5, "* " + string(global.enemy_name[0]))
}

if abouttocheck == 1 {
	draw_set_font(fnt_main)
	draw_text(100,267.5, "* " + string(global.enemy_name[0]))
}
else if abouttocheck == 2 {
	draw_set_font(fnt_main)
	draw_text(100,267.5, "* Check")
}
draw_set_colour(_oldcol)
draw_set_font(_oldfnt)