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
    	String Student_ID = request.getParameter("Student_ID");
    	String sql = "delete from Student "+
    	"where Student_ID ='"+Student_ID+"'";
    	tool tool = new tool();
    	int count = tool.update(sql);
    	if(count>0){
    		out.print("<script>alert('操作成功!');</script>");	
    	}else{
    		out.print("<script>alert('操作失败!');</script>");	
    	}
    	out.print("1111");
    	
     %>
</body>
</html>