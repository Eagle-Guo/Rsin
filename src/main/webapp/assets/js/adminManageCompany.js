function confirmCompanyInfo() {
	$.ajax({
        url: '/api/company/manage/update',
        type : "POST",
        data: $('#companyDetailForm').serialize(),
        timeout: 600000,
        success: function(response){
        	console.log("Update Successful", response);
        },
        error: function(e) {
        console.error("ERROR : ", e);
    }
    });
	var checkBox = document.getElementById("infoCheckbox");
	if (checkBox.checked == true) {
		$("#companyDetailForm input").prop("disabled", true);
		$("#txt_director").attr("disabled","disabled");
		$("#txt_shareholder").attr("disabled","disabled");		
	} else {
		$("#companyDetailForm input").prop('disabled', false);
		$("#txt_director").attr("disabled","disabled");
		$("#txt_shareholder").attr("disabled","disabled");	
	}	
}

$('#a_com_upload').click(function(){ $('#imgupload').trigger('click'); });
function companyshowfilediag(doc_id) {
	$('#file_com_upload'+doc_id).trigger('click');
}

function companydownloadfile(uuid) {
	var req = new XMLHttpRequest();
    req.open("GET", "/api/company/download/file?uuid=" + uuid, true);
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
}
function companypreviewfile(uuid) {
	var req = new XMLHttpRequest();
    req.open("GET", "/api/company/download/file?uuid=" + uuid, true);
    req.responseType = "blob";
    req.onload = function (event) {
        var blob = req.response;
        var blobURL = URL.createObjectURL(blob);
        window.open(blobURL);
    };
    req.send();
}
function companyuploadfile(company_id, id) {
	var formData = new FormData();
    formData.append("file",$("#file_com_upload" + id)[0].files[0]);
    formData.append("company_id", company_id);
    formData.append("id", id);
    $.ajax({
        url:'/api/company/upload/'+company_id,
        type:'post',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response){
        	console.log("Upload Successful", response);
        	alert('上传文件成功');
        },
        error: function(e) {
        	console.error("ERROR : ", e)
        	alert('上传文件失败');
        }
    });
} 
function companydeletefile(uuid) {
	var flag = confirm("提示: 确认删除此条记录吗? ");
	if(flag) {
		$.ajax({url: "/api/company/delete/file?uuid=" + uuid, 
			  success: function(result){
				  $('#AttachedReport'+uuid).remove();	
		}});
		
	}	
	
} 

//Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function lock(x) {
	var checkBox = document.getElementById("companyfilelock"+x);
	var text1 = document.getElementById("download_company_file"+x);
	var text2 = document.getElementById("preview_company_file"+x);
	var text3 = document.getElementById("upload_company_file"+x);
	var text4 = document.getElementById("delete_company_file"+x);
	var text5 = document.getElementById("sign_company_file"+x);	
	if (checkBox.checked == true){
		text1.style.color = "gray";
		text1.style.pointerEvents="none";	
		text1.style.textDecoration = "none";
		text2.style.color = "gray";
		text2.style.pointerEvents="none";	
		text2.style.textDecoration = "none";		
		text3.style.color = "gray";
		text3.style.pointerEvents="none";	
		text3.style.textDecoration = "none";		
		text4.style.color = "gray";
		text4.style.pointerEvents="none";	
		text4.style.textDecoration = "none";		
		text5.style.color = "gray";
		text5.style.pointerEvents="none";	
		text5.style.textDecoration = "none";				
	} else {
		text1.style.color = "#6777ef";
		text1.style.pointerEvents="unset";	 
		text2.style.color = "#6777ef";
		text2.style.pointerEvents="unset";			
		text3.style.color = "#6777ef";
		text3.style.pointerEvents="unset";			
		text4.style.color = "#6777ef";
		text4.style.pointerEvents="unset";	 		
		text5.style.color = "#6777ef";
		text5.style.pointerEvents="unset";			
	}
}	

function confirmInfo(x) {
	var checkBox = document.getElementById("infoCheckbox"+x);
	var text0 = document.getElementById("textInput00"+x);	
	var text1 = document.getElementById("textInput01"+x);
	var text2 = document.getElementById("textInput02"+x);
	var text3 = document.getElementById("textInput03"+x);
	var text4 = document.getElementById("textInput04"+x);
	var text5 = document.getElementById("textInput05"+x);	
	var text6 = document.getElementById("textInput06"+x);
	var text7 = document.getElementById("textInput07"+x);
	var text8 = document.getElementById("textInput08"+x);
	var text9 = document.getElementById("textInput09"+x);
	var text10 = document.getElementById("textInput10"+x);		
	var text11 = document.getElementById("textInput11"+x);
	var text12 = document.getElementById("textInput12"+x);		
	if (checkBox.checked == true){
		text0.style.pointerEvents="none";	 
		text1.style.pointerEvents="none";
		text1.style.borderColor="white";		
		text2.style.pointerEvents="none";
		text2.style.borderColor="white";				
		text3.style.pointerEvents="none";
		text3.style.borderColor="white";			
		text4.style.pointerEvents="none";
		text4.style.borderColor="white";				
		text5.style.pointerEvents="none";
		text5.style.borderColor="white";			
		text6.style.pointerEvents="none";	
		text6.style.borderColor="white";			
		text7.style.pointerEvents="none";	
		text7.style.borderColor="white";			
		text8.style.pointerEvents="none";	
		text8.style.borderColor="white";			
		text9.style.pointerEvents="none";
		text9.style.borderColor="white";			
		text10.style.pointerEvents="none";	
		text10.style.borderColor="white";			
		text11.style.pointerEvents="none";
		text11.style.borderColor="white";			
		text12.style.pointerEvents="none";	
		text12.style.borderColor="white";				
	} else {
		text0.style.pointerEvents="unset";	 
		text1.style.pointerEvents="unset";
		text1.style.borderColor="#e4e6fc";		
		text2.style.pointerEvents="unset";	
		text2.style.borderColor="#e4e6fc";			
		text3.style.pointerEvents="unset";	
		text3.style.borderColor="#e4e6fc";			
		text4.style.pointerEvents="unset";	
		text4.style.borderColor="#e4e6fc";			
		text5.style.pointerEvents="unset";	
		text5.style.borderColor="#e4e6fc";			
		text6.style.pointerEvents="unset";	
		text6.style.borderColor="#e4e6fc";			
		text7.style.pointerEvents="unset";	
		text7.style.borderColor="#e4e6fc";			
		text8.style.pointerEvents="unset";	
		text8.style.borderColor="#e4e6fc";			
		text9.style.pointerEvents="unset";	
		text9.style.borderColor="#e4e6fc";			
		text10.style.pointerEvents="unset";	
		text10.style.borderColor="#e4e6fc";			
		text11.style.pointerEvents="unset";	
		text11.style.borderColor="#e4e6fc";			
		text12.style.pointerEvents="unset";	 	
		text12.style.borderColor="#e4e6fc";					
	}
}	