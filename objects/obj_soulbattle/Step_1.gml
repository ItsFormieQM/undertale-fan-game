#region If keyboard key is held 
global.w_held = keyboard_check(ord("W"))
global.a_held = keyboard_check(ord("A"))
global.s_held = keyboard_check(ord("S"))
global.d_held = keyboard_check(ord("D"))

#endregion
#region If keyboard key is released
global.w_released = keyboard_check_pressed(ord("W"))
global.a_released = keyboard_check_pressed(ord("A"))
global.s_released = keyboard_check_pressed(ord("S"))
global.d_released = keyboard_check_pressed(ord("D"))
#endregion
