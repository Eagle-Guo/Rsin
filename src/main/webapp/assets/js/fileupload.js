$(function() {

    // preventing page from redirecting
    $("html").on("dragover", function(e) {
        e.preventDefault();
        e.stopPropagation();
        $("h4").text("拖到这里");
    });

    $("html").on("drop", function(e) { e.preventDefault(); e.stopPropagation(); });

    // Drag enter
    $('.upload-area').on('dragenter', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h4").text("放");
    });

    // Drag over
    $('.upload-area').on('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        $("h4").text("放");
    });

    // Drop
    $('.upload-area').on('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();

        $("h4").text("已上传");

        var file = e.originalEvent.dataTransfer.files;
        var fd = new FormData();
        fd.append('file', file[0]);
        uploadData(fd);
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
        uploadData(fd);
    });
});

// Sending AJAX request and upload file
function uploadData(formdata){
    $.ajax({
        url: '/api/uploadfile',
        type : "POST",
        enctype: 'multipart/form-data',
        data: formdata,
        contentType: false,
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function(response){
        	console.log("Upload Successful", response);
            //addThumbnail(response);
        },
        error: function(e) {
        console.log("ERROR : ", e);
    }
    });
}

// Added thumbnail
function addThumbnail(data){
    $("#uploadICdiv h4").remove();
    var len = $("#uploadICdiv div.thumbnail").length;

    var num = Number(len);
    num = num + 1;

    var name = data.name;
    var size = convertSize(data.size);
    var src = data.src;

    // Creating an thumbnail
    $("#uploadICdiv").append('<div id="thumbnail_'+num+'" class="thumbnail"></div>');
    $("#thumbnail_"+num).append('<img src="'+src+'" width="100%" height="78%">');
    $("#thumbnail_"+num).append('<span class="size">'+size+'<span>');

}

// Bytes conversion
function convertSize(size) {
    var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
    if (size == 0) return '0 Byte';
    var i = parseInt(Math.floor(Math.log(size) / Math.log(1024)));
    return Math.round(size / Math.pow(1024, i), 2) + ' ' + sizes[i];
}
