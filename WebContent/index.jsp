<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录后台管理系统</title>
<link href="css/dome.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>



</head>

<body>


	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录学生信息管理系统</span>
		<ul>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form action="charactercheck.jsp" method="post" id="signin">
				<ul>
					<li><input name="uname" type="text" class="loginuser" placeholder="用户名"/></li>
					<li><input name="upwd" type="password" class="loginpwd" placeholder="密码"/></li>
					
					<li><input name="" type="submit" class="loginbtn" value="登录" /></li>
				</ul>
				<div class="identity">
				选择角色：
					<select  name="identity">
						<option value="1">学生</option>
						<option value="2">管理员</option>
					</select>
				</div>
			</form>
		</div>

	</div>

	<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		})
	});
</script>



</body>

</html>
