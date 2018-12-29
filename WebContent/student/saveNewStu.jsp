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
		String phone = request.getParameter("Phone");
		String sql = "insert into Student(Student_ID,Student_Name,Phone,Gender,Date_of_Birth,Nation_of_Student,JiGuang_of_student,Class_ID)" +
					"values('" + stu_id + "','" + stu_name + "','" + stu_phone + "','" + stu_sex + "','" + stu_birth + "','" + stu_nation + "','" + stu_jiguang + "','" + stu_class + "')";
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