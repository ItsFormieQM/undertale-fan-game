//exception_unhandled_handler(function(exception) {
    
//    // 1. Open or create a text file to log the crash
//    var _file = file_text_open_write("crash_log.txt");
    
//    // 2. Save the error information provided by the exception struct
//    file_text_write_string(_file, "Game Crashed!\n");
//    file_text_write_string(_file, "Message: " + string(exception.message) + "\n");
//    file_text_write_string(_file, "Long Msg: " + string(exception.long_message) + "\n");
//    file_text_write_string(_file, "Script: " + string(exception.script) + "\n");
    
//    file_text_close(_file);
//    game_end(1)
//    // Note: The game will close immediately after this function ends.
//    // You cannot bypass the crash or use game_restart() here.
//});