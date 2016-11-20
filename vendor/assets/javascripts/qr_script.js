var gCtx = null;
var gCanvas = null;
var imageData = null;
var c=0;
var stype=0;
var gUM=false;
var webkit=false;
var moz=false;
var v=null;

var camhtml='  	<object  id="embedflash" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="320" height="320"> '+
  		'<param name="movie" value="camcanvas.swf" />'+
  		'<param name="quality" value="high" />'+
		'<param name="allowScriptAccess" value="always" />'+
  		'<embed  allowScriptAccess="always"  id="embedflash" src="images/camcanvas.swf" quality="high" width="320" height="320" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" mayscript="true"  />'+
    '</object>';

// var vidhtml = '<video id="v" autoplay></video>';

var vidhtml = "<div class='row'><video id='v' class='small-12 columns small-centered' autoplay></video></div>"

function initCanvas(ww,hh) {
    gCanvas = document.getElementById("qr-canvas");
    var w = ww;
    var h = hh;
    gCanvas.style.width = w + "px";
    gCanvas.style.height = h + "px";
    gCanvas.width = w;
    gCanvas.height = h;
    gCtx = gCanvas.getContext("2d");
    gCtx.clearRect(0, 0, w, h);
    imageData = gCtx.getImageData( 0,0,320,320);
}

function captureToCanvas() {
    if(stype!=1)
        return;
    if(gUM)
    {
        try{
            gCtx.drawImage(v,0,0);
            try{
                qrcode.decode();
                setTimeout(captureToCanvas, 500);
            }
            catch(e){
                console.log(e);
                setTimeout(captureToCanvas, 500);
            };
        }
        catch(e){
            console.log(e);
            setTimeout(captureToCanvas, 500);
        };
    }
    else
    {
        flash = document.getElementById("embedflash");
        try{
            flash.ccCapture();
        }
        catch(e)
        {
            console.log(e);
            setTimeout(captureToCanvas, 1000);
        }
    }
}

function htmlEntities(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function read(a) {
    console.log("qr code scanned!", a);
    //NOTE: this is where the QA scanner hooks into the backbone events
    window.BrandonApp.router.currentView.swapCheckInForms(a);
}

function isCanvasSupported() {
  var elem = document.createElement('canvas');
  return !!(elem.getContext && elem.getContext('2d'));
}

function success(stream) {
    if(webkit)
        v.src = window.URL.createObjectURL(stream);
    else
    if(moz)
    {
        v.mozSrcObject = stream;
        v.play();
    }
    else
        v.src = stream;
    gUM=true;
    setTimeout(captureToCanvas, 500);
}

function error(error) {
    gUM=false;
    return;
}

function load()
{
	if(isCanvasSupported() && window.File && window.FileReader)
	{
		initCanvas(800,600);
		qrcode.callback = read;
		// document.getElementById("mainbody").style.display="inline";
	}
	else
	{
		document.getElementById("mainbody").style.display="inline";
		document.getElementById("mainbody").innerHTML='<p id="mp1">QR code scanner for HTML5 capable browsers</p><br>'+
        '<br><p id="mp2">sorry your browser is not supported</p><br><br>'+
        '<p id="mp1">try <a href="http://www.mozilla.com/firefox"><img src="images/firefox.png"/></a> or <a href="http://chrome.google.com"><img src="images/chrome_logo.gif"/></a> or <a href="http://www.opera.com"><img src="images/Opera-logo.png"/></a></p>';
	}
}

function setwebcam() {
	// document.getElementById("result").innerHTML="- scanning -";
    if(stype==1)
    {
        setTimeout(captureToCanvas, 500);
        return;
    }
    var n=navigator;
    if(n.getUserMedia)
    {
        document.getElementById("outdiv").innerHTML = vidhtml;
        v=document.getElementById("v");
        n.getUserMedia({video: true, audio: false}, success, error);
    }
    else
    if(n.webkitGetUserMedia)
    {
        document.getElementById("outdiv").innerHTML = vidhtml;
        v=document.getElementById("v");
        webkit=true;

        (function(){
            MediaStreamTrack.getSources(function(sources){
                var vidSrc;
                sources.forEach(function(s){
                    if (s.kind === "video" & s.facing === "environment") {
                        vidSrc = s.id;
                    }
                });
                n.webkitGetUserMedia({video: {optional: [{sourceId: vidSrc}]}, audio: false}, success, error);
            });
        })();

        // var promise = new Promise(function(resolve, reject){
        //     MediaStreamTrack.getSources(function(sources){
        //         var vidSrc;
        //         sources.forEach(function(s){
        //             if (s.kind === "video" & s.facing === "environment") {
        //                 vidSrc = s.id;
        //             }
        //         });
        //         if (vidSrc) {
        //             resolve(vidSrc);
        //         } else {
        //             reject(vidSrc);
        //         }
        //     });
        // });
        // promise.then(
        //     function(resp){
        //     },
        //     function(resp){
        //         n.webkitGetUserMedia({video: {optional: [{sourceId: resp}]}, audio: false}, success, error);
        //     }
        // );
    }
    else
    if(n.mozGetUserMedia)
    {
        document.getElementById("outdiv").innerHTML = vidhtml;
        v=document.getElementById("v");
        moz=true;
        n.mozGetUserMedia({video: true, audio: false}, success, error);

    }
    else
        document.getElementById("outdiv").innerHTML = camhtml;

    // document.getElementById("qrimg").src="images/upload2.jpg";
    // document.getElementById("webcamimg").src="images/webcam1.jpg";
    stype=1;
    setTimeout(captureToCanvas, 500);
}
