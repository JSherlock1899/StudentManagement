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
    	String stu_id = request.getParameter("Student_ID");
    	String stu_name = request.getParameter("Student_Name");
    	String stu_phone = request.getParameter("Phone");
    	String stu_sex = request.getParameter("Gender");
    	String stu_birth = request.getParameter("BirthDate");
    	String stu_nation = request.getParameter("Nation");
    	String stu_jiguang = request.getParameter("JiGuan");
    	String stu_class = request.getParameter("ClassID");
    	
    	String sql = "update Student set Student_Name = '"+stu_name+"',phone = '"+stu_phone+"',Gender = '"+stu_sex+"'"+
    	",Date_of_Birth = '" + stu_birth + "',Nation_of_Student = '" + stu_nation + "',JiGuang_of_student = '" + stu_jiguang + "',Class_ID = '" + stu_class + "'" +
    	"where Student_ID = '"+stu_id+"'";
    	tool tool = new tool();
    	System.out.println(sql);
    	int rs = tool.update(sql);
    	if(rs>0){
    		out.print("<script>alert('操作成功!');</script>");
    	}else{
    		out.print("<script>alert('操作失败!');</script>");
    	}
     %>
</body>
</html>