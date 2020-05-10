<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>网站建设中</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../../assets/comingsoon/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/css/util.css">
	<link rel="stylesheet" type="text/css" href="../../assets/comingsoon/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	
	<div class="bg-g1 size1 flex-w flex-col-c-sb p-l-15 p-r-15 p-t-55 p-b-35 respon1">
		<span></span>
		<div class="flex-col-c p-t-50 p-b-50">
			<h3 class="l1-txt1 txt-center p-b-10">
				网站建设中
			</h3>

			<p class="txt-center l1-txt2 p-b-60">
				您访问的页面正在建设中
			</p>

			<div class="flex-w flex-c cd100 p-b-82">
				<div class="flex-col-c-m size2 how-countdown">
					<span class="l1-txt3 p-b-9 days">7</span>
					<span class="s1-txt1">Days</span>
				</div>

				<div class="flex-col-c-m size2 how-countdown">
					<span class="l1-txt3 p-b-9 hours">17</span>
					<span class="s1-txt1">Hours</span>
				</div>

				<div class="flex-col-c-m size2 how-countdown">
					<span class="l1-txt3 p-b-9 minutes">50</span>
					<span class="s1-txt1">Minutes</span>
				</div>

				<div class="flex-col-c-m size2 how-countdown">
					<span class="l1-txt3 p-b-9 seconds">39</span>
					<span class="s1-txt1">Seconds</span>
				</div>
			</div>

			<button class="flex-c-m s1-txt2 size3 how-btn"  onclick="javascript:window.history.back();">
				返回
			</button>
			
			<br/>
			<button class="flex-c-m s1-txt2 size3 how-btn"  data-toggle="modal" data-target="#subscribe">
				请关注我们的更新
			</button>
			
			
		</div>

		<span class="s1-txt3 txt-center">
			@ 2020 Coming Soon. Designed by Rsin Pte Ltd.
		</span>
		
	</div>

	<!-- Modal Login -->
	<div class="modal fade" id="subscribe" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document" data-dismiss="modal">
			<div class="modal-subscribe where1-parent bg0 bor2 size4 p-t-54 p-b-100 p-l-15 p-r-15">
				<button class="btn-close-modal how-btn2 fs-26 where1 trans-04">
					<i class="zmdi zmdi-close"></i>
				</button>

				<div class="wsize1 m-lr-auto">
					<h3 class="m1-txt1 txt-center p-b-36">
						<span class="bor1 p-b-6">订阅</span>
					</h3>

					<p class="m1-txt2 txt-center p-b-40">
						请关注我们的更新!
					</p>

					<form class="contact100-form validate-form">
						<div class="wrap-input100 m-b-10 validate-input" data-validate = "Name is required">
							<input class="s1-txt4 placeholder0 input100" type="text" name="name" placeholder="Name">
							<span class="focus-input100"></span>
						</div>

						<div class="wrap-input100 m-b-20 validate-input" data-validate = "Email is required: ex@abc.xyz">
							<input class="s1-txt4 placeholder0 input100" type="text" name="email" placeholder="Email">
							<span class="focus-input100"></span>
						</div>

						<div class="w-full">
							<button class="flex-c-m s1-txt2 size5 how-btn1 trans-04">
								获取更新
							</button>
						</div>
					</form>

					<p class="s1-txt5 txt-center wsize2 m-lr-auto p-t-20">
						别担心，您随时可以取消订阅！
					</p>
				</div>
			</div>

		</div>
	</div>

	

<!--===============================================================================================-->	
	<script src="../../assets/comingsoon/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../../assets/comingsoon/vendor/bootstrap/js/popper.js"></script>
	<script src="../../assets/comingsoon/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../../assets/comingsoon/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../../assets/comingsoon/vendor/countdowntime/moment.min.js"></script>
	<script src="../../assets/comingsoon/vendor/countdowntime/moment-timezone.min.js"></script>
	<script src="../../assets/comingsoon/vendor/countdowntime/moment-timezone-with-data.min.js"></script>
	<script src="../../assets/comingsoon/vendor/countdowntime/countdowntime.js"></script>
	<script>
		$('.cd100').countdown100({
			// Set Endtime here
			// Endtime must be > current time
			endtimeYear: 0,
			endtimeMonth: 0,
			endtimeDate: 7,
			endtimeHours: 18,
			endtimeMinutes: 0,
			endtimeSeconds: 0,
			timeZone: "" 
			// ex:  timeZone: "America/New_York", can be empty
			// go to " http://momentjs.com/timezone/ " to get timezone
		});
	</script>
<!--===============================================================================================-->
	<script src="../../assets/comingsoon/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="../../assets/comingsoon/js/main.js"></script>

</body>
</html>