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
        "columns": [
            { "data": "name" },
            { "data": "createdDate" },
            { "data": null,
                "bSortable": false,
                "mRender": function (o) {
                	return  "<div class='badge badge-danger'><a href='/adminDownLoadFile' target='_blank'>新公司注册</a></div> <div class='badge badge-danger'><a href='/adminTimeLine' target='_blank'>时间表</a></div>"},
            },
            {"data": null, "bSortable": false, "mRender": " "}
        ]
    } );
} );