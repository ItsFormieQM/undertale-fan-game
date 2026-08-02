var _oldcol = draw_get_colour()
var _oldfnt = draw_get_font()

#region Draw Kris's HP (btw ts isnt ai gen, i just found about regions and its making shit easier to organize)
draw_set_font(fnt_battlehp_real) 
draw_set_colour(c_white)
draw_text(340,408, string(global.hp) + "/" + string(global.max_hp))
#endregion

draw_set_font(_oldfnt)
draw_set_colour(_oldcol)



