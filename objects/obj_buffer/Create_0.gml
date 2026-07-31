if !file_exists("savedata.txt") {
	room_goto_next()
}
else {
	var _fileid = file_text_open_read("savedata.txt")
	var should_del = file_text_read_string(_fileid)
	file_text_readln(_fileid)
	
	if should_del == "DELETE" { // easy fix 
		file_delete("savedata.txt")
		room_goto_next()
	}
	else {
		scr_load()
	}	
}