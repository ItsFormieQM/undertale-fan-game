function scr_tempsave(){
	file_delete("savedata.txt")
	var _file = file_text_open_write("savedata.txt");
	var del = "DELETE"
	file_text_write_string(_file, del); 
    file_text_writeln(_file);
	file_text_close(_file)
}