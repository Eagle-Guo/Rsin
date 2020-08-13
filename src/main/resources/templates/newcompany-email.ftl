<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>创建新公司 - 确认邮件</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

    <!-- use the font -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            font-size: 48px;
        }
    </style>
</head>
<body style="margin: 0; padding: 0;">

    <table align="center" border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;">
        <tr>
            <td align="center" bgcolor="#78ab46" style="padding: 40px 0 30px 0;">
                <a href="http://ec2-18-141-177-227.ap-southeast-1.compute.amazonaws.com:8080/login" target="_blank"> 
                    <img src="cid:logo.jpg" alt="睿信集团" style="display: block;" />
                </a>
            </td>
        </tr>
        <tr>
            <td bgcolor="#eaeaea" style="padding: 40px 30px 40px 30px;">
                <p>尊敬的 ${name},</p>
                <p>我们已经收到您的申请, 请<b><a href=${completedLink} target="_blank">点击</a></b>完成新公司的注册:</p>
                <p>或拷贝以下链接在浏览器打开</p>
                <p>${completedLink}</p>
            </td>
        </tr>
        <tr>
            <td bgcolor="#777777" style="padding: 30px 30px 30px 30px;">
                <p>${signature}</p>
            </td>
        </tr>
    </table>

</body>
</html>