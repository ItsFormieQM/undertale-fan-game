var _oldcol = draw_get_colour()
var _oldfnt = draw_get_font()

#region Draw Kris's name
draw_set_font(fnt_battlehp_real) 
draw_set_colour(c_white)
draw_text(32,410, "KRIS")
#endregion

draw_set_colour(_oldcol)
draw_set_font(_oldfnt)
