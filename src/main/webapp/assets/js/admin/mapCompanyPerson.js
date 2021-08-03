var index = 1;

function addName(name){
	var idAndName = $("#select_name").val();
	var arrayIdAndName = idAndName.split("_");
	var id = arrayIdAndName[0];
	var name = arrayIdAndName[1];
	var type = $("#select_type").val();
	if (type == '董事') {
		$("#director_name").append("<div class='element' id='div_"+ id +"'></div>");
		$("#div_"+ id).append("<input type='text' readonly id='person_"+ id +"'  value='"+name+"'>&nbsp;<span id='remove_" + id + "' class='remove'>X</span>");
	} else if (type == '股东') {
		$("#shareholder_name").append("<div class='element' id='div_"+ id +"'></div>");
		$("#div_"+ id).append("<input type='text' readonly id='person_"+ id +"'  value='"+name+"'>&nbsp;<span id='remove_" + id + "' class='remove'>X</span>");
	} else if (type == '联系人') {
		$("#contact_name").append("<div class='element' id='div_"+ id +"'></div>");
		$("#div_"+ id).append("<input type='text' readonly id='person_"+ id +"'  value='"+name+"'>&nbsp;<span id='remove_" + id + "' class='remove'>X</span>");
	}
}

$(document).ready(function(){
	//Remove element
	$('#companyDetailForm').on('click','.remove',function(){
	    var id = this.id;
	    var split_id = id.split("_");
	    var deleteindex = split_id[1];
	
	    // Remove <div> with id
	    $("#div_" + deleteindex).remove();
	});  
});

function confirmCompanyInfo(){
	alert("修改成功!");
	//$.post(
    //        "/api/admin/mapPerson",
    //        { 	"services" : JSON.stringify(services),
    //        	"companyInfos": JSON.stringify(companyInfos),
    //        	"shareholderInfos" : JSON.stringify(shareholderInfos)},
    //        function(data, status) {
    //    	   alert("公司信息保存: " + data + "\nStatus: " + status);
    //     	   $('#save_flag').val("true").trigger('change');
    //        }
    //     );
}