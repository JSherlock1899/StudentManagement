<%@page import="java.sql.ResultSet"%>
<%@page import="com.Student.tool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		tool tool = new tool();
		String sql = "select * from Course";
		ResultSet rs = tool.select(sql);
		String sql1 = "select * from Student";
		
		out.print("<table border=2 class='table'>" + "<tr>" + "<th>课程号</th><th>课程名</th><th>学分</th><th>学时</th>"
				+ "<th>开课学院</th><th>授课讲师</th><th>执行操作</th>" + "</tr>");

		while (rs.next()) {
			String C_ID = rs.getString(1);
			String C_Name = rs.getString(2);
			String Credit = rs.getString(3);
			String C_Hourst = rs.getString(4);
			String T_ID = rs.getString(6);
			
			
			String sql2 = "select * from Teacher where T_ID = '" + T_ID + "'";
			ResultSet Trs = tool.select(sql2);
			String T_Name = null;
			String XY_Name = null;
				if (Trs.next()) {
					T_Name = Trs.getString(2);														//找到每门课的授课讲师
					String sql3 = "select * from Course where C_ID = '" + C_ID + "'";
					ResultSet XYrs = tool.select(sql3);												//找到每门课的开课学院
						
					if (XYrs.next()) {
						XY_Name = XYrs.getString(2);
									
						}
					
					}
				out.print("<tr>" + "<td >" + C_ID + "</td><td>" + C_Name + "</td><td>" + Credit
						+ "</td><td>" + C_Hourst + "</td>" +

						"<td>" + XY_Name + "</td><td>" + T_Name + "</td><td>" + "</td></tr>");
		}
		
		out.print("</table>");
	%>
</body>
</html>