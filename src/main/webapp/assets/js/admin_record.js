$(document).ready(function() {
    $('#adminRecord').DataTable( {
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
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },              
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },  
            { "data": "uen" },
            { "data": "name" },
            { "data": "uen" },
            { "data": "name" },
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>导出</a></div>"},
            },            
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>导出</a></div>"},
            },           
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>下载</a></div>"},
            },
            {"data": "step"}
        ]
    } );
} );