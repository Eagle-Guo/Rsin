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
