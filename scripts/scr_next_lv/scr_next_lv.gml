function scr_next_lv(_current_lv){
    switch (_current_lv) {
		case 0:
			global.lv = 1
        case 1:  
			return 10;
        case 2:  
			return 20;
        case 3:  
			return 40;
        case 4:  
			return 50;
        case 5:  
			return 80;
        case 6:  
			return 100;
        case 7:  
			return 200;
        case 8:  
			return 300;
        case 9:  
			return 300;
        case 10: 
			return 400;
        case 11: 
			return 500;
        case 12: 
			return 1000;
        case 13: 
			return 1500;
        case 14: 
			return 2000;
        case 15: 
			return 3000;
        case 16: 
			return 5000;
        case 17:
			return 10000;
        case 18: 
			return 25000;
        case 19: 
			return 49999;
        case 20: 
			return "Proceed"; // Already maxed at LV 20
	}
}

