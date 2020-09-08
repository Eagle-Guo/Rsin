		  var specialElementHandlers = {
		      '#editor': function (element, renderer) {
		    	  console.log("#editor" + element);
		          return true;
		      }
		  };
		  function clone_pdf_div(div_id) {
			  $(div_id).clone().appendTo('#temporary');
			  // remove the class text_cn
			  $("#temporary").find('.text_cn').remove();
			  $("#temporary").find('.card-header').remove();
		  };
			  
	      function remove_clone_div() {
	    	  $("#temporary").empty();
		  };
		  
		  $('#downloadDoc1').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b1");
			  var source_html = $('#temporary').html();
			  var source = $('#temporary');
			  console.log(source_html);
			  console.log(source);
			  doc.fromHTML(source_html, 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('First-Director-Meeting-Resolution.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc2').click(function () {
			  var doc = new jsPDF();
			  console.log($('#temporary').html());
			  clone_pdf_div("#b2");
			  console.log($('#temporary').html());
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Secretary-Agreement.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc3').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b3");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Notice-for-Controllers.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc4').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b4");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Application-of-Shares.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc5').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b5");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Client-Acceptance-Form.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc6').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b6");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Form-45-201.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc7').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b7");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Share-Certificate.pdf');
		      remove_clone_div();
		  });
		  $('#downloadDoc8').click(function () {
			  var doc = new jsPDF();
			  clone_pdf_div("#b8");
			  doc.fromHTML($('#temporary').html(), 15, 15, {
	                 'width': 170,
	                 'elementHandlers': specialElementHandlers
	  		  });
		      doc.save('Nominee-Dir-Authrn-Final.pdf');
		      remove_clone_div();
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