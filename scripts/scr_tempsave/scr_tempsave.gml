function scr_tempsave(){
	file_delete("savedata.txt")
	var _file = file_text_open_write("savedata.txt");
	file_text_close(_file)
}