<%@page import="Admin.*"%>
<%@page import="com.Student.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8"); //设置编码格式
		String name = request.getParameter("uname"); 
		String pwd = request.getParameter("upwd");
		String character = request.getParameter("identity"); //判断登录者身份
		int character_int = Integer.parseInt(character);

		int result = -1; //返回的结果	
		if(character_int == 1){
			Studentinformation information = new Studentinformation(name, pwd);//判断登录者是否有登录权限
			tool tool = new tool();
			result = tool.StudentLogin(information);
			if (result > 0) { //判断登录是否成功
				session.setAttribute("username", name);
				out.print("<script> window.location='User.jsp' </script>");
			} else if (result == 0) {
				out.print("<script> alert('用户名或密码有误！');window.location='index.jsp' </script>");
			} else {
				out.print("<script> alert('系统异常!');window.location='index.jsp' </script>");
			}
		}else if(character_int == 2){
			Admininformation information = new Admininformation(name, pwd);//判断登录者是否有登录权限
			tool tool = new tool();
			result = tool.AdminLogin(information);
			if (result > 0) { //判断登录是否成功
				out.print("<script> window.location='Admin.jsp' </script>");
				session.setAttribute("username", name);
			} else if (result == 0) {
				out.print("<script> alert('管理员用户名或密码有误！');window.location='index.jsp' </script>");
			} else {
				out.print("<script> alert('系统异常!');window.location='index.jsp' </script>");
			}
		}else{
			out.print("<script> alert('系统异常!');window.location='index.jsp' </script>");
		}		
		tool.close(); //关闭资源
		
	%>
	
</body>
</html>