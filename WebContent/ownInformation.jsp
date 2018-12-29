<%@page import="com.Student.tool"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/table.css" rel="stylesheet" type="text/css"/>
<title>Insert title here</title>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		tool tool = new tool();
	    String sql = "select isnull(phone,0) from Student"; //把空值赋值为0  
		tool.select(sql);
		ResultSet rs = tool.Getinformation(username);
		while(rs.next()){
    		//分别输出上述内容
        	out.print(
        			"<table border=2 class='table'>"+
        					"<caption style='text-align:center;font-size:30px;margin-bottom:20px'>我的信息</caption>"+
              		      "<tr>"+
              		        "<th>学号</th><th>姓名</th><th>性别</th><th>出生年月</th>"+
              		      "</tr>"+
              		      "<tr>"+
              		        "<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td>"+
              		      "</tr>"+
              		      "<tr>"+
            		        "<th>民族</th><th>籍贯</th><th>班级</th><th>联系方式</th>"+
            		      "</tr>"+
            		      "<tr>"+
            		        "<td>" + rs.getString(5) + "</td><td>" + rs.getString(6) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(11) + "</td>"+
            		      "</tr>"+
              		    "</table>");
		}
		rs.close();
	%>
	
	
</body>
</html>