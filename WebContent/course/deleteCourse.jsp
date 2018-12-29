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
		String sql = "delete from Course "+
		    	"where C_ID ='"+course_id+"'";
		    	tool tool = new tool();
		    	int count = tool.update(sql);
		    	if(count>0){
		    		out.print("<script>alert('操作成功!');</script>");	
		    	}else{
		    		out.print("<script>alert('操作失败!');</script>");	
		    	}
	%>
</body>
</html>