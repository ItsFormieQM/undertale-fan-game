if global.w_held || global.s_held || global.a_held || global.d_held || blue_timer != 0{
    global.ismoving = true;
    //if global.ismoving {
	//	print("MOVING")
	//}
}

else {
    global.ismoving = false;
	//if !global.ismoving {
	//	print("STILL")
	//}
}
//show_debug_message("MOVE TRUTHY: " + string(global.ismoving == 1 ? "True" : "False"))