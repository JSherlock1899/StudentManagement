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
		String sql = "update Course set C_Name = '"+course_name+"',Credit = '"+course_Credit+"',C_Hourst = '"+course_Hours+"'"+",XY_ID = '"+course_XY+"'"+",T_ID = '"+course_T+"'"+
		    	"where C_ID = '"+course_id+"'";
		tool tool = new tool();
    	int rs = tool.update(sql);
    	if(rs > 0){
			out.print("<script>alert('操作成功！');</script>");
		}else{
			out.print("<script>alert('操作失败！');</script>");

		}
	%>
</body>
</html>