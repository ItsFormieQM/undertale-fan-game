var _oldfnt = draw_get_font()
var _oldcol = draw_get_colour()

draw_set_font(fnt_main)
var _damagetest = 1
//draw_text(x,y,string(global.damage_took))
//draw_text_ext(x,y,string))
draw_text_transformed(self.x,self.y,global.damage_took, 0.7,0.7,0)

draw_set_colour(_oldcol)
draw_set_font(_oldfnt)