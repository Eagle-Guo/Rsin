var file_name, file_size;
$(function() {
    // preventing page from redirecting
    /*$("html").on("dragover", function(e) {
        e.preventDefault();
        e.stopPropagation();
        $("h6").text("拖到这里");
    });*/

    $("html").on("drop", function(e) { e.preventDefault(); e.stopPropagation(); });

    // Drag enter
    $("#uploadICdiv").on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放");
    });
    $("#uploadICdiv").on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放...");
    });
    // Drop
    $("#uploadICdiv").on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("上传中...");
        var file = e.originalEvent.dataTransfer.files;
        var fd = new FormData();
        fd.append('file', file[0]);
        uploadData(fd, "uploadICdiv");
    });
    $("#uploadICdiv").on('dragend', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("点击或将图片拖拽到此区域");
    });

    $("#uploadAddressdiv").on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放");
    });
    $("#uploadAddressdiv").on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放");
    });
    // Drop
    $("#uploadAddressdiv").on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("上传中...");
        var file = e.originalEvent.dataTransfer.files;
        var fd = new FormData();
        fd.append('file', file[0]);
        uploadData(fd, "uploadAddressdiv");
    });

    $("#uploadPassworddiv").on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放");
    });
    // Drag over
    $("#uploadPassworddiv").on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("请释放");
    });
    // Drop
    $("#uploadPassworddiv").on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h6").text("上传中...");
        var file = e.originalEvent.dataTransfer.files;
        var fd = new FormData();
        fd.append('file', file[0]);
        uploadData(fd,"uploadPassworddiv");
    });
   

    // Open file selector on div click
    $("#uploadICdiv").click(function(){
        $("#uploadIC1").click();
    });
    // file selected
    $("#uploadIC1").change(function(){
        var fd = new FormData();
        var files = $('#uploadIC1')[0].files[0];
        fd.append('file',files);
        file_name = files.name;
        file_size = files.size;
        uploadData(fd);
    });
    
    $("#uploadAddressdiv").click(function(){
        $("#uploadAddress1").click();
    });
    $("#uploadAddress1").change(function(){
        var fd = new FormData();
        var files = $('#uploadAddress1')[0].files[0];
        fd.append('file',files);
        file_name = files.name;
        file_size = files.size;
        uploadData(fd);
    });
    $("#uploadPassworddiv").click(function(){
        $("#uploadpassport1").click();
    });
    $("#uploadpassport1").change(function(){
        var fd = new FormData();
        var files = $('#uploadpassport1')[0].files[0];
        fd.append('file',files);
        file_name = files.name;
        file_size = files.size;
        uploadData(fd);
    });
    
});

// Sending AJAX request and upload file
function uploadData(formdata, uploadType){
    $.ajax({
        url: '/api/uploadfile',
        type : "POST",
        enctype: 'multipart/form-data',
        data: formdata,
        contentType: false,  // tell jQuery not to set contentType
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        cache: false,
        timeout: 600000,
        success: function(response){
        	console.log("Upload Successful", response);
            addThumbnail(formdata, uploadType);
        },
        error: function(e) {
        console.error("ERROR : ", e);
    }
    });
}

// Added thumbnail
function addThumbnail(data, uploadType){
	console.log(data);
	console.log(uploadType);
    $("#uploadICdiv h6").remove();
    var len = $("#uploadICdiv div.thumbnail").length;

    var num = Number(len);
    num = num + 1;

    //var name = file_name; //data.name;
    var size = convertSize(file_size);
    //var src = data.src;

    // Creating an thumbnail
    $("#uploadICdiv").append('<h6>文件 '+file_name+' 上传成功! 文件大小为' + size + '<h6>');
//    $("#uploadICdiv").append('<div id="thumbnail_'+num+'" class="thumbnail"></div>');
//    $("#thumbnail_"+num).append('<span class="size">'+file_name+'<span>');
//    $("#thumbnail_"+num).append('<span class="size">'+size+'<span>');

}

// Bytes conversion
function convertSize(size) {
    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (size == 0) return '0 Byte';
    var i = parseInt(Math.floor(Math.log(size) / Math.log(1024)));
    return Math.round(size / Math.pow(1024, i), 2) + ' ' + sizes[i];
}
