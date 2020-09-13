		function clone_pdf_div(div_id) {
			  $(div_id).clone().appendTo('#temporary');
			  // remove the class text_cn
			  $("#temporary").find('.text_cn').remove();
			  $("#temporary").find('.card-header').remove();
		  };
			  
	      function remove_clone_div() {
	    	  $("#temporary").empty();
	    	  //console.log("remove temporary clone div");
		  };
		  
		  $('#downloadDoc1').click(function () {
			 var urlToSend = "/api/downloadFile";
		     var req = new XMLHttpRequest();
		     req.open("GET", urlToSend, true);
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
			  clone_pdf_div("#b2");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Secretary-Agreement.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc3').click(function () {
			  clone_pdf_div("#b3");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Notice-for-Controllers.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc4').click(function () {
			  clone_pdf_div("#b4");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Application-of-Shares.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc5').click(function () {
			  clone_pdf_div("#b5");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Client-Acceptance-Form.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc6').click(function () {
			  clone_pdf_div("#b6");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Form-45-201.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc7').click(function () {
			  clone_pdf_div("#b7");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Share-Certificate.pdf');        
				});
		      remove_clone_div();
		  });
		  $('#downloadDoc8').click(function () {
			  clone_pdf_div("#b8");
			  html2canvas(document.getElementById('temporary')).then(function (canvas) {
				  var img = canvas.toDataURL("image/png");
				  var doc = new jsPDF();
				  doc.addImage(img, 'JPEG', 20, 20);
				  doc.save('Nominee-Dir-Authrn-Final.pdf');        
				});
		      remove_clone_div();
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
        function openCity(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }