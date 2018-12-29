<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" action='../student/changeStu.jsp' method='post'>
    <fieldset>
      <div id="legend" class="">
        <legend class="">请输入要修改信息的学生的学号:</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">学生学号</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='stu_id'>
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          <legend class="">请输入要修改的信息:</legend>
          <!-- Text input-->
          <label class="control-label" for="input01">学生姓名</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='stu_name'>
            <p class="help-block"></p>
          </div>
        </div>

        <div class="control-group">

             <!-- Text input-->
             <label class="control-label" for="input01">学生班级</label>
             <div class="controls">
               <input type="text" placeholder="" class="input-xlarge" name='stu_class'>
               <p class="help-block"></p>
             </div>
           </div>

       <div class="control-group">

             <!-- Text input-->
             <label class="control-label" for="input01">学生性别</label>
             <div class="controls">
               <input type="text" placeholder="" class="input-xlarge" name='stu_sex'>
               <p class="help-block"></p>
             </div>
       </div>
       
       <div class="control-group">

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success">执行</button>
          </div>
        </div>
    </form>
</body>
</html>