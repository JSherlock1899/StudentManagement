<%@page import="java.sql.ResultSet"%>
<%@page import="com.Student.tool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" title="" rel="stylesheet" />
<link title="" href="css/userStyle.css" rel="stylesheet" type="text/css"  />
<link title="blue" href="css/dermadefault.css" rel="stylesheet" type="text/css"/>
<link title="green" href="css/dermagreen.css" rel="stylesheet" type="text/css" disabled="disabled"/>
<link title="orange" href="css/dermaorange.css" rel="stylesheet" type="text/css" disabled="disabled"/>
<script language='javascript'  src="js/jquery-1.11.1.min.js" ></script>
<script language='javascript'  src="js/jquery.cookie.js" ></script>
<script language='javascript'  src="js/bootstrap.min.js" ></script>
</head>
<body>
	<%
		String name = (String) session.getAttribute("username");
		tool tool = new tool();
		String nickname = tool.GetName(name);
	%>

	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
  <div class="navbar-header">
    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand mystyle-brand"><span class="glyphicon glyphicon-home"></span></a> </div>
  <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav">
      <li class="li-border"><a class="mystyle-color" href="#">用户界面</a></li>
      <li><a class="mystyle-color" href="#"><%
			out.print(nickname);
		%>,欢迎您！</a></li>
    </ul>

    <ul class="nav navbar-nav pull-right">
       <li class="li-border">
          <a href="#" class="mystyle-color">
            <span class="glyphicon glyphicon-bell"></span>
            <span class="topbar-num">0</span>
          </a>
      </li>
      <li class="li-border dropdown"><a href="#" class="mystyle-color" data-toggle="dropdown">
      <span class="glyphicon glyphicon-search"></span> 搜索</a>
         <div class="dropdown-menu search-dropdown">
            <div class="input-group">
                <input type="text" class="form-control">
                 <span class="input-group-btn">
                   <button type="button" class="btn btn-default">搜索</button>
                </span>
            </div>
         </div>
      </li>
      <li class="dropdown li-border"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">帮助与文档<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">帮助</a></li>
          <li class="divider"></li>
          <li><a href="#">论坛</a></li>
          <li class="divider"></li>
          <li><a href="#">博客</a></li>
        </ul>
      </li>
      <li class="dropdown li-border">
         <a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">我的
         <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="index.jsp">退出</a></li>
        </ul>
      </li>
      <li class="dropdown"><a href="#" class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span class="caret"></span></a>
        <ul class="dropdown-menu changecolor">
          <li id="blue"><a href="#">蓝色</a></li>
          <li class="divider"></li>
          <li id="green"><a href="#">绿色</a></li>
          <li class="divider"></li>
          <li id="orange"><a href="#">橙色</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
<div class="down-main">
  <div class="left-main left-off">
    <div class="sidebar-fold"><span class="glyphicon glyphicon-menu-hamburger"></span></div>
      <div class="subNavBox">
          <div class="sBox">
              <div class="subNav sublist-down"><span class="title-icon glyphicon glyphicon-chevron-down"></span><span
                      class="sublist-title">选择操作</span>
              </div>

          <div class="sBox">
              <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                      class="sublist-title"><a href="ownInformation.jsp" target="select_frame">查看个人信息</a></span>
              </div>
          </div>
          <div class="sBox">
              <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                      class="sublist-title"><a href="ownGradeInformation.jsp" target="select_frame">查看成绩信息</a></span>
              </div>
      	</div>
      	<div class="sBox">
              <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                      class="sublist-title"><a href="ownCourseInformation.jsp" target="select_frame">查看选课信息</a></span>
              </div>
      	</div>
      	<div class="sBox">
              <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span
                      class="sublist-title"><a href="selectCourse.jsp" target="select_frame">选修课选课</a></span>
              </div>
      	</div>
  </div>
  <div class="right-product right-off">
		
 	<iframe src="" frameborder="0" width="1500px" height="800px" id="select_frame" name="select_frame" style="margin:0 auto;"></iframe>
  </div>
</div>
<script type="text/javascript">
$(function(){
/*换肤*/
$(".dropdown .changecolor li").click(function(){
	var style = $(this).attr("id");
    $("link[title!='']").attr("disabled","disabled");
	$("link[title='"+style+"']").removeAttr("disabled");

	$.cookie('mystyle', style, { expires: 7 }); // 存储一个带7天期限的 cookie
})
var cookie_style = $.cookie("mystyle");
if(cookie_style!=null){
    $("link[title!='']").attr("disabled","disabled");
	$("link[title='"+cookie_style+"']").removeAttr("disabled");
}

/*左侧导航栏显示隐藏功能*/
$(".subNav").click(function(){
			/*显示*/
			if($(this).find("span:first-child").attr('class')=="title-icon glyphicon glyphicon-chevron-down")
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-down");
			    $(this).find("span:first-child").addClass("glyphicon-chevron-up");
			    $(this).removeClass("sublist-down");
				$(this).addClass("sublist-up");
			}
			/*隐藏*/
			else
			{
				$(this).find("span:first-child").removeClass("glyphicon-chevron-up");
				$(this).find("span:first-child").addClass("glyphicon-chevron-down");
				$(this).removeClass("sublist-up");
				$(this).addClass("sublist-down");
			}
		// 修改数字控制速度， slideUp(500)控制卷起速度
	    $(this).next(".navContent").slideToggle(300).siblings(".navContent").slideUp(300);
	})
/*左侧导航栏缩进功能*/
$(".left-main .sidebar-fold").click(function(){

	if($(this).parent().attr('class')=="left-main left-full")
	{
		$(this).parent().removeClass("left-full");
		$(this).parent().addClass("left-off");

		$(this).parent().parent().find(".right-product").removeClass("right-full");
		$(this).parent().parent().find(".right-product").addClass("right-off");

		}
	else
	{
		$(this).parent().removeClass("left-off");
		$(this).parent().addClass("left-full");

		$(this).parent().parent().find(".right-product").removeClass("right-off");
		$(this).parent().parent().find(".right-product").addClass("right-full");

		}
	})

  /*左侧鼠标移入提示功能*/
		$(".sBox ul li").mouseenter(function(){
			if($(this).find("span:last-child").css("display")=="none")
			{$(this).find("div").show();}
			}).mouseleave(function(){$(this).find("div").hide();})
})


function setIframeHeight(iframe) {
	if (iframe) {
		var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		if (iframeWin.document.body) {
			//iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
			$("#ifr_pag").css("height",iframeWin.document.body.scrollHeight);
		}
	}
};

//动态执行setIframeHeight(),即动态更改iframe高度（频率是每秒执行5次）
$.fn.setinframeH = function(){
	var objDOM = document.getElementById('ifr_pag');
	var url = objDOM.contentWindow.location.href.split("/");
	url = url[url.length - 1];
	var int1 = setInterval(function(){
		setIframeHeight(objDOM)},200);
 
	if(url != "editQuest.html"){
		window.clearInterval(int1);
	}
}

</script>

</body>
</html>