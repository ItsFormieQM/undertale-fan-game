function scr_midbattle_convo(){
	for (var i = 0; i < 256; i++) {
		global.bconvo[i] = 0
	}
	switch global.battlegroup {
		case "Sans":
			global.sndtxt_delay_convob = 3.65
			global.txt_delay = 1.7
			global.typer_snd_convob = snd_sanstxt1
			global.bfont = fnt_sans
			global.bconvo[0] = " what you think i will just \n stand^ there and take it?"
			global.bconvo[1] = " get a chance kid."
			global.bconvo[2] = " our reports showed a \n massive anomaly in the \n timespace continuum."
			global.bconvo[3] = " timelines jumping \n left and right, \n stopping and starting..."
			global.bconvo[4] = " until suddenly, \neverything ends."
			global.bconvo[5] = " heh heh heh..."
			global.bconvo[6] = " that's your fault, \nisn't it?"
			global.bconvo[7] = " you can't understand \n how this feels."
			global.bconvo[8] = " knowing that one day, \n without any warning..."
			global.bconvo[9] = " it's all going to \n be reset."
			global.bconvo[10] = " look. i gave up trying \n to go back a long \n time ago."
			global.bconvo[11] = " and getting to the \n surface doesn't \n really appeal \n anymore, either."
			global.bconvo[12] = " cause even if we do..."
			global.bconvo[13] = " we'll just end up \n right back here, \n without any memory \n of it, right?"
			global.bconvo[14] = " kris... \n what happened?"
			global.bconvo[15] = " kris... \n i know your still there"
			global.bconvo[16] = " you were so kind \n back home..."
			global.bconvo[17] = " your mom is so \n kindhearted."
			global.bconvo[18] = " you could have been \n friends with everyone here..."
			global.bconvo[19] = " but instead..."
			global.bconvo[20] = " you decided to kill \n them all..."
			global.bconvo[21] = " ..."
			global.bconvo[22] = " kris... is that red of a \n SOUL making you do all \n of these horrible acts?"
			global.bconvo[23] = " or you just did this in \n spite of me taking \n care of your mother?"
			break
		default:
			global.bfont = fnt_main
			global.bconvo[0] = "Nah I'd goon"
			break
	}
}