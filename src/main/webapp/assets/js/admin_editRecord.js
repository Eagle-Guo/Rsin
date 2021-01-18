$(document).ready(function() {
    $('#adminEditRecord').DataTable( {
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
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },                      
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>公司信息修改</a></div> <div class='badge badge-danger'><a href='/adminTimeLine?id=" + data + 
                	        "' target='_blank'>时间表信息修改</a></div>"},
            },
            {"data": "step"}
        ]
    } );
} );