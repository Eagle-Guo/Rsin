var checkBoxes = $('input.compulsory_read'), submitButton = $('#submit_sign');

checkBoxes.change(function () {
    submitButton.attr("disabled", checkBoxes.is(":not(:checked)"));
    if(checkBoxes.is(":not(:checked)")) {
        submitButton.addClass('disabled');
    } else {
        submitButton.removeClass('disabled');
    }       
});

$('#downloadDoc1').click(function () {
     var req = new XMLHttpRequest();
     req.open("GET", "/api/downloadSignature/1", true);
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
     req.open("GET", "/api/downloadSignature/2", true);
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
	     req.open("GET", "/api/downloadSignature/3", true);
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
	     req.open("GET", "/api/downloadSignature/4", true);
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
	     req.open("GET", "/api/downloadSignature/5", true);
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
	     req.open("GET", "/api/downloadSignature/6", true);
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
	     req.open("GET", "/api/downloadSignature/7", true);
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
	     req.open("GET", "/api/downloadSignature/8", true);
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
  
  $('#download_all').click(function () {
	 
  });

function viewPri(x) {
    document.getElementsByClassName("leftTab active")[0].classList.remove("active");
    document.getElementsByClassName("priDesc view")[0].classList.remove("view");
    document.getElementById("b-" + x).classList.add("active");
    document.getElementById("b" + x).classList.add("view");
   /* document.getElementById("rightImgPri").src = "images/abroad/ca/Primary/sc/Ontario/fprivate" + x + ".jpg";*/
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
	
    $(function () { $('.tooltip-show').tooltip('show');});
