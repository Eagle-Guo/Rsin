$(document).ready(function() {
	$('#adminEditRecord tfoot th').each( function () {
        var title = $(this).text();
        if (title == 'UEN' || title == '公司名称' || title == '注册日期' || title == '年审时间' || title == '财务年度时间') {
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
            { "data": "annualAudit" },
            { "data": "financePeriod" },                      
            { "data": "id",
                "render": function (data, type, row, meta) {
                	return "<div class='badge badge-danger'><a href='/admin/adminManageCompany?id=" + data + "' target='_blank'>公司信息修改</a></div>" +
                           "<div class='badge badge-danger'><a href='/admin/mapCompanyPerson?id=" + data + "' target='_blank'>股东联系人修改</a></div>" +
                           "<div class='badge badge-danger'><a href='/admin/adminTimeLine?id=" + data + "' target='_blank'>时间表信息修改</a></div>" +
                           "<div class='badge badge-danger'><a href='/api/admin/downloadAllFiles/" + data + "' target='_blank'>下载公司所有文件</a></div>"},
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