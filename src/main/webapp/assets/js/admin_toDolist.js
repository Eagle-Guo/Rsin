//$(document).ready(function() {
//    $('#companies').DataTable( {
//    	ajax: {
//            url: '/api/allPendingCompanies',
//            method: "GET",
//            xhrFields: {
//                withCredentials: true
//            },
//            dataSrc:""
//         },
//        "deferRender": true,
//        "bScrollCollapse": true,
//        "bAutoWidth": false, // Disable the auto width calculation 
//        "aoColumns": [
//          { "sWidth": "40%" }, // 1st column width 
//          { "sWidth": "30%" }, // 1st column width 
//          { "sWidth": "10%" }, // 2nd column width
//          { "sWidth": "10%" }, // 3rd column width
//          { "sWidth": "10%" } // 4th column width and so on 
//        ],
//        "columns": [
//            { "data": "name" },
//            { "data": "backupName", "defaultContent": ""},
//            { "data": "uen", "defaultContent": "" },
//            { "data": "registrationDate", "defaultContent": "" },
//            { "data": "id",
//                "render": function (data, type, row, meta) {
//                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
//                	        "' target='_blank'>新公司注册</a></div> <div class='badge badge-danger'><a href='/adminTimeLine?id=" + data + 
//                	        "' target='_blank'>时间表</a></div>"},
//            },
//        ]
//    } );
//} );

$(document).ready(function() {
	$('#companysTable').tablesorter( {
		sortList: [[0,0]]
	}).tablesorterPager({container: $("#pager")});

	$("#companysTable").bind("sortEnd", function() {
		$("#companysTable tr").removeClass("tableRowOdd").removeClass("tableRowEven");
		$("#companysTable tr:nth-child(odd)").addClass("tableRowEven");
		$("#companysTable tr:nth-child(even)").addClass("tableRowOdd");
	});

	$("#companysTable tr:nth-child(odd)").addClass("tableRowEven");
});

function export_file() {
	return ;
}
