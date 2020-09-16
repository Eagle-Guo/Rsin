function viewPri(x) {
    document.getElementsByClassName("leftTab active")[0].classList.remove("active");
    document.getElementsByClassName("priDesc view")[0].classList.remove("view");
    document.getElementById("b-" + x).classList.add("active");
    document.getElementById("b" + x).classList.add("view");
}    
    //检查图片
    function checkReviewImage(fileUploadPart, reviewPart) {
        var fileName=$(fileUploadPart).val();
        fileName=fileName.replace("C:\\fakepath\\","");
        var flag=true;
        if(fileName==""){
            flag=false;
            alert("请选择图片");
        }
        else{
            var size = $(fileUploadPart)[0].files[0].size;
            if(size/1000000>2){
                flag=false;
                alert("图片大小不能超过2MB");
            }
        }
        if(flag){
            onLoadImage(fileUploadPart, reviewPart);
        }
        else{//清除input type=file的显示内容
            $(fileUploadPart).val("");
        }
        return flag;
    }

    //预览图片
    function onLoadImage(fileUploadPart, reviewPart) {
        var file=$(fileUploadPart).get(0).files[0];
        var reader = new FileReader();
        //将文件以Data URL形式读入页面
        reader.readAsDataURL(file);
        reader.onload=function(e){
            //显示文件
            $(reviewPart).html('<img src="' + this.result +'" alt="" />');
        }
    }

    /*上传图片
  imageUpload 详细参考链接：https://www.cnblogs.com/qiumingcheng/p/6854933.html
   1.processData设置为false。因为data值是FormData对象，不需要对数据做处理。
   2.<form>标签添加enctype="multipart/form-data"属性。
   3.cache设置为false，上传文件不需要缓存。
   4.contentType设置为false，不设置contentType值，因为是由<form>表单构造的FormData对象，且已经声明了属性enctype="multipart/form-data"，所以这里设置为false。
   */
    function checkSubmit() {
        var formdata=new FormData();
		console.log($('#filename').get(0).files[0]);
        formdata.append('fileName',$('#filename').get(0).files[0]);
		console.log(formdata);
        $.ajax({
            async: false,
            type: 'POST',
            url: "/imageUpload",
            dataType: 'json',
            data: formdata,
            contentType:false,//ajax上传图片需要添加
            processData:false,//ajax上传图片需要添加
            success: function (data) {
                if(data.hasOwnProperty("relativePath")){
                    $("#showImage").html("<img src='"+data.relativePath+"'/>");
                }
                else {
                    $("#showImage").html("上传失败");
                }
                alert(data.result_msg);
            },
            error: function (e) {
                alert("error");
            }
        })
    }
