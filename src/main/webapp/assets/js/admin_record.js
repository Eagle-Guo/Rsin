$(document).ready(function() {
	$('#adminRecord tfoot th').each( function () {
        var title = $(this).text();
        if (title == 'UEN' || title == '公司名称' || title == '注册日期') {
        	$(this).html( '<input type="text" placeholder="搜索 '+title+'" />' );
        }
    } );
    $('#adminRecord').DataTable( {
    	ajax: {
            url: '/api/allCompanies',
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
            { "data": "registrationDate" },
            { "data": "directors" },
            { "data": "nominated" },  
            { "data": "shareholder" },
            { "data": "secretary" },
            { "data": "contactPerson" },
            { "data": "totalStockCapital" },
            { "data": "actualStockCapital" },              
            { "data": "annualAudit" },
            { "data": "financePeriod" },
            { "data": "gstax" },
            { "data": "eci" },
            { "data": "incometaxSubmit" },  
            { "data": "incometaxPay" },
            { "data": "address" },
            { "data": "step" },
            { "data": "agency" },
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
        ],
        initComplete: function () {
            // Apply the search
            this.api().columns().every( function () {
                var that = this;
                $( 'input', this.footer() ).on( 'keyup change clear', function () {
                    if ( that.search() !== this.value ) {
                        that.search( this.value ).draw();
                    }
                } );
            } );
        }
    } );
    
} );