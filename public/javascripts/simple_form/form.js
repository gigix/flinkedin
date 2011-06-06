function init() {
	var dateSel = document.getElementsByClassName('date_input')[0];
	dateSel.value = 'YYYY/MM/DD';
	dateSel.className += ' default';
	date = new calendarInput(dateSel);
}

AttachEvent(window,'load',init,false);