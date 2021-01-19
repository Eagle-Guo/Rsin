$(document).ready(function() {
	$('#adminEditRecord tfoot th').each( function () {
        var title = $(this).text();
        if (title == 'UEN' || title == '公司名称' || title == '注册日期') {
        	$(this).html( '<input type="text" placeholder="搜索 '+title+'" />' );
        }
    } );
	
    $('#adminEditRecord').DataTable( {
    	ajax: {
            url: '/api/allCompanies',
            method: "GET",
            dataSrc:""
         },
        "deferRender": true ,
        "columns": [
            { "data": "uen" },
            { "data": "name" },
            { "data": "registrationDate" },
            { "data": "step" },
            { "data": "step" },                      
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return  "<div class='badge badge-danger'><a href='/adminManageCompany?id=" + data + 
                	        "' target='_blank'>公司信息修改</a></div> <div class='badge badge-danger'><a href='/adminTimeLine?id=" + data + 
                	        "' target='_blank'>时间表信息修改</a></div>"},
            },
            {"data": "step"}
        ],
        initComplete: function () {
            // Apply the search
            this.api().columns().every( function () {
                var that = this;
 
                $( 'input', this.footer() ).on( 'keyup change clear', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
        }
    } );
} );