function toFreeInsStatus(status){
	var msg;
	switch(status){
	case 1: 
		msg="Saved";
		break;
	case 2:
		msg="Submitted";
		break;
	case 3:
		msg="Confirmed";
		break;
	default:
		msg="Null";
		break;
	}
	return msg;
}

function formatDate(date){
	var d = new Date(date);
	month = '' + (d.getMonth()+1);
	day = '' + d.getDate(),
	year = '' + d.getFullYear();
	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	return [year, month, day].join('-');
		
}