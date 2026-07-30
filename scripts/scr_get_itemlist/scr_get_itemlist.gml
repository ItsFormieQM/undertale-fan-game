function scr_get_itemlist(){
    /* enums 
    item_monstercandy - start at 0
    ...
    */
    
    // Dynamically get the length so it never goes out of bounds
    var _inv_length = array_length(global.item);

    for (var i = 0; i < _inv_length; i++) {
        switch (global.item[i]) {
            case "item_monstercandy":
                global.item[i] = "Monster Candy";
                break;
                
            case "item_friedpipis_ph":
                global.item[i] = "Fried Pipis";
                break;
                
            case "item_toastedbun":
                global.item[i] = "Toasted Bun";
                break;
                
            case "item_annoyingdog":
                global.item[i] = "Annoying Dog";
                break;
                
            case "item_memories":
                global.item[i] = "Memories";
                break;
                
            case "item_hopesanddreams":
                global.item[i] = "Hopes And Dreams";
                break;
                
            case "item_seatea":
                global.item[i] = "Sea Tea";
                break;
            
			case pointer_null:
			case "used":
				global.item[i] = "Nothing"
				//var _len = array_length(global.item);
				
				//// Shift everything right
			    //for (var _x = _len - 1; i > 0; _x--) {
			    //    global.item[i] = global.item[i - 1];
			    //}
				break;
            default:
                global.item[i] = "Null";
                break;
        }
    }
}
