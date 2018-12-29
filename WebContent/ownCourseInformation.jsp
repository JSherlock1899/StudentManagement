<%@page import="java.sql.ResultSet"%>
<%@page import="com.Student.tool"%>
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
		ResultSet crs = tool.GetCourseinformation(username);
		ResultSet Trs = tool.GetTeacherinformation(username);
		out.print("<p style='text-align:center;font-size:30px;'>已选课程</p>"+"<table border=2 class='table'>"+
    		      "<tr>"+
    		      "<th>课程ID</th><th>课程名</th><th>学分</th><th>学时</th><th>任课教师</th>"+
    		      "</tr>");
		while(crs.next()){
			String C_ID = crs.getString(1);
			String C_Name = crs.getString(2);
			String C_Credit = crs.getString(3);
			String C_Hourst = crs.getString(4);
			
			String T_Name = null;
			if(Trs.next()){
				
				T_Name = Trs.getString(19);
				
			}
			out.print(
      		      "<tr>"+
      		      "<td>" + C_ID + "</td><td>" + C_Name + "</td><td>" + C_Credit + "</td><td>" + C_Hourst + "</td><td>" + T_Name + "</td>"+
      		      "</tr>"
      		      );
		}
		out.print("</table>");
	%>
</body>
</html>