$(document).ready(function() {
    $('#example').DataTable( {
    	ajax: {
            url: '/api/allPendingCompanies',
            method: "GET",
            xhrFields: {
                withCredentials: true
            },
            dataSrc:""
         },
        "deferRender": true ,
        "columns": [
            { "data": "name" },
            { "data": "registrationDate" },
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>新公司注册</a></div> <div class='badge badge-danger'><a href='/adminTimeLine?id=" + data + 
                	        "' target='_blank'>时间表</a></div>"},
            },
            {"data": "step"}
        ]
    } );
} );