<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.Student.tool" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/table.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<jsp:include page="AdminQueryShow.jsp" flush ="true"></jsp:include><br>
	<%	
		request.setCharacterEncoding("UTF-8"); //设置编码格式
    	String choice = request.getParameter("student");
		int choice_int = Integer.parseInt(choice);
    	String key = request.getParameter("tiaojian");
    	ResultSet rs=null; 
    	String str="";
    	switch(choice_int){
			case 1:str="select * from Student where Student_ID ='"+key+"';";break;
			case 2:str="select * from Student where Student_Name ='"+key+"';";break;
			case 3:str="select * from Student where Gender ='"+key+"';";break;
			case 4:str="select * from Student where phone='"+key+"';";break;
			case 5:str="select * from Student where Class_ID ='"+key+"';";break;
			case 6:str="select * from Student where Nation_of_Student ='"+key+"';";break;
			
    	}
    	tool tool = new tool();
    	//调用查询函数
    	rs=tool.select(str);
    	if(rs.isBeforeFirst()){
    		out.print("<table border=1 class='table'>"+"<tr>"+
	    	        "<th>学号</th><th>姓名</th><th>性别</th><th>民族</th><th>籍贯</th><th>班级</th><th>联系方式</th>"+
	    	      "</tr>");
    	}else{
    		out.print("<script>alert('对不起，没有找到您查询的数据!')</script>");
    	}
    	
    	while(rs.next()){
    		//分别输出上述内容
        	out.print(
	    	      "<tr>"+
	    	        "<td>"+ rs.getString(1)+ "</td><td>"+rs.getString(2) +"</td><td>" +rs.getString(3) +"</td><td>" + rs.getString(5)+"</td><td>" + rs.getString(6) +"</td><td>" + rs.getString(7) +"</td><td>"+rs.getString(11) + "</td>"+
	    	      "</tr>");
		}
    	rs.close(); //关闭资源
    	out.print("</table>");
     %>
</body>
</html>