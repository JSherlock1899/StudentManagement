<%@page import="com.Student.tool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //设置编码格式
		String course_id = request.getParameter("course_id");
		String course_name = request.getParameter("course_name");
		String course_Credit = request.getParameter("course_Credit");
		String course_Hours = request.getParameter("course_Hours");
		String course_XY = request.getParameter("course_XY");
		String course_T = request.getParameter("course_T");
		
		String sql = "insert into Course(C_ID,C_Name,Credit,C_Hourst,XY_ID,T_ID)values('"+
				course_id + "','" +course_name+"','"+course_Credit+"','"+course_Hours+"','" +course_XY +"','" +course_T +"')";
		tool tool = new tool();
		int result = tool.update(sql);
		if(result > 0){
			out.print("<script>alert('操作成功！');</script>");
		}else{
			out.print("<script>alert('操作失败！');</script>");

		}
	%>
</body>
</html>