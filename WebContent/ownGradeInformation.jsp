<%@page import="com.Student.tool"%>
<%@page import="java.sql.ResultSet"%>
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
		ResultSet rs = tool.GetSCinformation(username);
		out.print("<p style='text-align:center;font-size:30px;'>我的成绩</p>"+"<table border=2 class='table'>"+
  		      "<tr>"+
  		      "<th>所修课程</th><th>总评成绩</th><th>获得学分</th>"+
  		      "</tr>");
		
		while(rs.next()){
			String C_ID = rs.getString(2);
			String C_Name = null;
			int Credit = 0;
			int Grade = rs.getInt(5);
			String sql = "select * FROM Course where C_ID = '" + C_ID +"'";
			ResultSet Crs = tool.select(sql);  //返回课程的相关信息
			if(Crs.next()){
				C_Name = Crs.getString(2);
				Credit = Crs.getInt(3);    //返回该课程学分
				if(Grade < 60){					//若不及格则不获得学分
					Credit = 0;
				}
			}
			out.print( "<tr>"+
      		      "<td>" + C_Name + "</td><td>" + Grade + "</td><td>" + Credit + "</td>"+
      		      "</tr>"
      		      );	
			
		}
		out.print("</table>");
		rs.close();
		
	%>
</body>
</html>