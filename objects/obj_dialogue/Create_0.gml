// Object Initialization
// visible = false; // Uncomment if this object manages drawing manually
scr_dialogue()
var _scale = 5;
image_xscale = _scale;
image_yscale = 1.75;

// Player & Dialogue Control Flags
global.canmove = false;
global.interacted = 0;
con = 0;

// Dialogue System Setup
_text = []  
timer = 0
_visible_text = 0
i = 0
//i = 0// Current message index in global.msg
     // Store current text string
char_index = 0;             // How many characters are currently visible
pause_timer = 0;            // Step counter
pause_delay = 3;            // Steps between each character typing out (lower = faster)