function removeChildren(node) {
	for (i=0;i<node.childNodes.length;i++) {
		node.removeChild(node.childNodes[0]);
	}
}

function getXY(obj) 
{
	var newObj = new Object();
	newObj.x = obj.offsetLeft;
	newObj.y = obj.offsetTop;
	/*
	theParent = obj.offsetParent;
	while(theParent != null)
	{
		newObj.y += theParent.offsetTop;
		newObj.x += theParent.offsetLeft;
		theParent = theParent.offsetParent;
	}
	*/
	return newObj;
}

/*
    Written by Jonathan Snook, http://www.snook.ca/jonathan
    Add-ons by Robert Nyman, http://www.robertnyman.com
*/

function getElementsByClassName(oElm, strTagName, strClassName){
    var arrElements = (strTagName == "*" && document.all)? document.all : oElm.getElementsByTagName(strTagName);
    var arrReturnElements = new Array();
    strClassName = strClassName.replace(/\-/g, "\\-");
    var oRegExp = new RegExp("(^|\\s)" + strClassName + "(\\s|$)");
    var oElement;
    for(var i=0; i<arrElements.length; i++){
        oElement = arrElements[i];      
        if(oRegExp.test(oElement.className)){
            arrReturnElements.push(oElement);
        }   
    }
    return (arrReturnElements)
}

function DetachEvent(obj, evt, fnc, useCapture){
	if (!useCapture) useCapture=false;
	if(obj.removeEventListener){ // Mozilla
		obj.removeEventListener(evt,fnc,useCapture);
		return true;
	} else if (obj.detachEvent) { // IE
		return obj.detachEvent("on"+evt,fnc);
	}
}

//*** This code is copyright 2003 by Gavin Kistner, gavin@refinery.com
//*** It is covered under the license viewable at http://phrogz.net/JS/_ReuseLicense.txt
function AttachEvent(obj,evt,fnc,useCapture){
	if (!useCapture) useCapture=false;
	if (obj.addEventListener){
		obj.addEventListener(evt,fnc,useCapture);
		return true;
	} else if (obj.attachEvent) return obj.attachEvent("on"+evt,fnc);
	else{
		MyAttachEvent(obj,evt,fnc);
		obj['on'+evt]=function(){ MyFireEvent(obj,evt) };
	}
} 
//The following are for browsers like NS4 or IE5Mac which don't support either
//attachEvent or addEventListener
function MyAttachEvent(obj,evt,fnc){
	if (!obj.myEvents) obj.myEvents={};
	if (!obj.myEvents[evt]) obj.myEvents[evt]=[];
	var evts = obj.myEvents[evt];
	evts[evts.length]=fnc;
}
function MyFireEvent(obj,evt){
	if (!obj || !obj.myEvents || !obj.myEvents[evt]) return;
	var evts = obj.myEvents[evt];
	for (var i=0,len=evts.length;i<len;i++) evts[i]();
}