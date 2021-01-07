var checkBoxes = $('input.compulsory_read');
let usercounts = new Set();
for (var i = 0; i < checkBoxes.length; i++) {
	usercounts.add(checkBoxes[i].name);
}
function updatePadId (id) {
	alert ("Canvas:" + id);
	if (id==0) {
		return true;
	}
	var oriValue = document.getElementById("signature-pad");
	var newValue = document.getElementById("signature-pad"+id);
	oriValue.id = "signature-pad"+id;
	newValue.id = "signature-pad";
}

checkBoxes.change(function () {
	for (var i = 0; i < usercounts.size; i++) {
		var allcheckBox = $('input:checkbox[name^=cb-' + i + ']');
		var count = 0;
		for (var j = 0; j < allcheckBox.length; j++) {
			if($(allcheckBox[j]).prop("checked") == true){
				count = count + 1;
            }
		}
		if (count == allcheckBox.length) {
			$("#submit_sign"+i).prop('disabled', false);
		} else {
			$("#submit_sign"+i).prop('disabled', true);
	    }   
	}
});

function SubForm(id){
	var formData = new FormData();
	var file_id = "#myFile" + id;
	$("#uploaddoc"+id).attr("disabled", "disabled");  
    formData.append("file",$(file_id)[0].files[0]);
    formData.append("id", id);
    $.ajax({
        url:'/api/uploadfile/offline/singature/'+id, /*接口域名地址*/
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Upload Successful", response);
        	
        },
        error: function(e) {
        	console.error("ERROR : ", e)
        }
    });
}
  $('#downloadDoc1').click(function () {
     var req = new XMLHttpRequest();
     req.open("GET", "/api/downloadfile/1", true);
     req.responseType = "blob";
     req.onload = function (event) {
         var blob = req.response;
         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
         var link=document.createElement('a');
         link.href=window.URL.createObjectURL(blob);
         link.download=fileName;
         link.click();
     };
     req.send();
  });
  
  $('#downloadDoc2').click(function () {
	 var req = new XMLHttpRequest();
     req.open("GET", "/api/downloadfile/2", true);
     req.responseType = "blob";
     req.onload = function (event) {
         var blob = req.response;
         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
         var link=document.createElement('a');
         link.href=window.URL.createObjectURL(blob);
         link.download=fileName;
         link.click();
     };
     req.send();
  });
  $('#downloadDoc3').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/3", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  $('#downloadDoc4').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/4", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  $('#downloadDoc5').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/5", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  $('#downloadDoc6').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/6", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  $('#downloadDoc7').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/7", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  $('#downloadDoc8').click(function () {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/8", true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var fileName = req.getResponseHeader("fileName") //if you have the fileName header available
	         var link=document.createElement('a');
	         link.href=window.URL.createObjectURL(blob);
	         link.download=fileName;
	         link.click();
	     };
	     req.send();
  });
  
  function previewDoc(docId) {
	  var req = new XMLHttpRequest();
	     req.open("GET", "/api/downloadfile/"+docId, true);
	     req.responseType = "blob";
	     req.onload = function (event) {
	         var blob = req.response;
	         var blobURL = URL.createObjectURL(blob);
	         window.open(blobURL);
	     };
	     req.send();
  }

  function preview (docId) {
	  pdffile=document.getElementById("myFile"+ docId).files[0];
	  if (!pdffile) {
		  alert("请先选择文件");
		  return false;
	  }
	  pdffile_url=URL.createObjectURL(pdffile);
	  window.open(pdffile_url, '_blank');
  }
  
function viewPri(x) {
    document.getElementsByClassName("leftTab active")[0].classList.remove("active");
    document.getElementsByClassName("priDesc view")[0].classList.remove("view");
    document.getElementById("b-" + x).classList.add("active");
    document.getElementById("b" + x).classList.add("view");
}
function openSignboard(evt, eventName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(eventName).style.display = "block";
  evt.currentTarget.className += " active";
}

/* tab part */
function openTab(evt, PartName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(PartName).style.display = "block";
    evt.currentTarget.className += " active";
}

$(function(){ 
	$('[data-toggle="tooltip"]').tooltip();
	// $('.collapsible1').addClass("accordion-pending-header");
});
