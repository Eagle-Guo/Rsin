var wrapper0 = document.getElementById("signature-pad0");
var clearButton0 = wrapper0.querySelector("[data-action=clear]");
//var changeColorButton = wrapper0.querySelector("[data-action=change-color]");
var undoButton0 = wrapper0.querySelector("[data-action=undo]");
var savePNGButton0 = wrapper0.querySelector("[data-action=save-png]");
var canvas0 = wrapper0.querySelector("canvas");
var signaturePad0 = new SignaturePad(canvas0, {
  // It's Necessary to use an opaque color when saving image as JPEG;
  // this option can be omitted if only saving aWs PNG or SVG
    backgroundColor: 'rgb(255, 255, 255)'
});

// Adjust canvas coordinate space taking into account pixel ratio,
// to make it look crisp on mobile devices.
// This also causes canvas to be cleared.
function resizeCanvas() {
  // When zoomed out to less than 100%, for some very strange reason,
  // some browsers report devicePixelRatio as less than 1
  // and only part of the canvas is cleared then.
  var ratio =  1; //Math.max(window.devicePixelRatio || 1, 1);

  // This part causes the canvas to be cleared
  canvas0.width = canvas0.offsetWidth * ratio;
  canvas0.height = canvas0.offsetHeight * ratio;
  canvas0.getContext("2d").scale(ratio, ratio);

  // This library does not listen for canvas changes, so after the canvas is automatically
  // cleared by the browser, SignaturePad#isEmpty might still return false, even though the
  // canvas looks empty, because the internal data of this library wasn't cleared. To make sure
  // that the state of this library is consistent with visual state of the canvas, you
  // have to clear it manually.
  signaturePad0.clear();
}

// On mobile devices it might make more sense to listen to orientation change,
// rather than window resize events.
window.onresize = resizeCanvas;
resizeCanvas();

function download(dataURL, filename) {
  if (navigator.userAgent.indexOf("Safari") > -1 && navigator.userAgent.indexOf("Chrome") === -1) {
    window.open(dataURL);
  } else {
    var blob = dataURLToBlob(dataURL);
    var url = window.URL.createObjectURL(blob);

    var a = document.createElement("a");
    a.style = "display: none";
    a.href = url;
    a.download = filename;

    document.body.appendChild(a);
    a.click();

    window.URL.revokeObjectURL(url);
  }
}

function dataURLtoBlob2(dataurl) {
      var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
          bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
      while(n--){
        u8arr[n] = bstr.charCodeAt(n);
      }
      return new Blob([u8arr], {type:mime});
}
function uploadSignature(mimetype, companyShareholderInfoId, btnId) {
    var dataurl = signaturePad0.toDataURL(mimetype);
    var blobdata = dataURLtoBlob2(dataurl);

    var fd = new FormData(document.getElementById("UploadForm" + btnId));
    //fd.append("data[signature]", blobdata, "filename");
    fd.append('signature',blobdata);
    /** will result in normal file upload with post name "signature" on target url **/
    $.ajax({
        url: "/api/onlineSubmitSignture/" + companyShareholderInfoId,
        type: 'POST',
        data: fd,
        beforeSend: function(){
            // Show image container
            $("#loading").show();
        },
        processData: false,
        contentType: false,
        dataType: 'html',
        success: function (response) {
            console.log(response);
            var allFilename = $.parseJSON(response);
            var result = "";
            $.each(allFilename, function(name, value){
                console.log(name + "--> " + value);   
                result = result + "<div class='col-md-6 col-xs-6 col-sm-6'> <a href = '/api/downloadFiles/" + value +"' class='fa fa-file-pdf-o' style='font-size:60px;color:red' download></a> <br />" + name  + "</div>";
            });
            $('#withSingatureDoc' + btnId).html(result);
        },
        complete: function(data){
            // Hide image container
            $("#loading").hide();
        },
        error: function (e) {
            console.log(e);
        }
    });
}

// One could simply use Canvas#toBlob method instead, but it's just to show
// that it can be done using result of SignaturePad#toDataURL.
function dataURLToBlob(dataURL) {
  // Code taken from https://github.com/ebidel/filer.js
  var parts = dataURL.split(';base64,');
  var contentType = parts[0].split(":")[1];
  var raw = window.atob(parts[1]);
  var rawLength = raw.length;
  var uInt8Array = new Uint8Array(rawLength);

  for (var i = 0; i < rawLength; ++i) {
    uInt8Array[i] = raw.charCodeAt(i);
  }

  return new Blob([uInt8Array], { type: contentType });
}

clearButton0.addEventListener("click", function (event) {
  signaturePad0.clear();
});

undoButton0.addEventListener("click", function (event) {
  var data = signaturePad0.toData();

  if (data) {
    data.pop(); // remove the last dot or line
    signaturePad0.fromData(data);
  }
});

savePNGButton0.addEventListener("click", function (event) {
    var btn_name = $(event.target).attr('name');
    var btn_id = event.target.id;
    if (signaturePad0.isEmpty()) {
    	alert("请先输入您的签名!");
        return false;
    } else {
        var retVal = confirm("我已经阅读并了解以上所有文件内容，并且同意签署以上所有文件，并确认提交签名样本。");
        if( retVal == true ) {
            var dataURL = signaturePad0.toDataURL('image/png');
            uploadSignature('image/png', btn_name.substr(11), btn_id.substr(11)); //get the button name after submit_sign
            return true;
        } else {
            return false;
        }
    }
});

var wrapper1 = document.getElementById("signature-pad1");
var clearButton1 = wrapper1.querySelector("[data-action=clear]");
var undoButton1 = wrapper1.querySelector("[data-action=undo]");
var savePNGButton1 = wrapper1.querySelector("[data-action=save-png]");
var canvas1 = wrapper1.querySelector("canvas");
var signaturePad1 = new SignaturePad(canvas1, {
  backgroundColor: 'rgb(255, 255, 255)'
});
function resizeCanvas1() {
var ratio =  1; //Math.max(window.devicePixelRatio || 1, 1);
canvas1.width = 460;
canvas1.height = 300;
canvas1.getContext("2d").scale(ratio, ratio);
signaturePad1.clear();
}
window.onresize = resizeCanvas1;
resizeCanvas1();
function uploadSignature2(mimetype, companyShareholderInfoId, btnId) {
    var dataurl = signaturePad1.toDataURL(mimetype);
    var blobdata = dataURLtoBlob2(dataurl);

    var fd = new FormData(document.getElementById("UploadForm" + btnId));
    //fd.append("data[signature]", blobdata, "filename");
    fd.append('signature',blobdata);
    /** will result in normal file upload with post name "signature" on target url **/
    $.ajax({
        url: "/api/onlineSubmitSignture/" + companyShareholderInfoId,
        type: 'POST',
        data: fd,
        beforeSend: function(){
            // Show image container
            $("#loading").show();
        },
        processData: false,
        contentType: false,
        dataType: 'html',
        success: function (response) {
            console.log(response);
            var allFilename = $.parseJSON(response);
            var result = "";
            $.each(allFilename, function(name, value){
                console.log(name + "--> " + value);   
                result = result + "<div class='col-md-6 col-xs-6 col-sm-6'> <a href = '/api/downloadFiles/" + value +"' class='fa fa-file-pdf-o' style='font-size:60px;color:red' download></a> <br />" + name  + "</div>";
            });
            $('#withSingatureDoc' + btnId).html(result);
        },
        complete: function(data){
            // Hide image container
            $("#loading").hide();
        },
        error: function (e) {
            console.log(e);
        }
    });
}
clearButton1.addEventListener("click", function (event) {signaturePad1.clear();});
undoButton1.addEventListener("click", function (event) {
	var data = signaturePad1.toData();
	if (data) {
		data.pop(); // remove the last dot or line
		signaturePad1.fromData(data);
	}
});
savePNGButton1.addEventListener("click", function (event) {
    var btn_name = $(event.target).attr('name');
    var btn_id = event.target.id;
    if (signaturePad1.isEmpty()) {
    	alert("请先输入您的签名!");
        return false;
    } else {
        var retVal = confirm("我已经阅读并了解以上所有文件内容，并且同意签署以上所有文件，并确认提交签名样本。");
        if( retVal == true ) {
            var dataURL = signaturePad1.toDataURL('image/png');
            uploadSignature2('image/png', btn_name.substr(11), btn_id.substr(11)); //get the button name after submit_sign
            return true;
        } else {
            return false;
        }
    }
});