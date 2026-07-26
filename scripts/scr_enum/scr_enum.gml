// Enums must be declared globally outside of functions
enum gamestate {
    saved,
    died,
    quit,
    current_room
}

function scr_init_gamestate(){
    // Create an array large enough to hold all enum slots
    global.gamestate_array = array_create(4, 0); 
    
    // Example: Initialize your array slots with starting values
    global.gamestate_array[gamestate.saved] = false;
    global.gamestate_array[gamestate.died] = 0;
    global.gamestate_array[gamestate.quit] = false;
    global.gamestate_array[gamestate.current_room] = scr_getroom
}
