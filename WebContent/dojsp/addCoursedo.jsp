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
	  <form class="form-horizontal" style="margin-left:100px" action="../course/addCourse.jsp">
    <fieldset>
      <div id="legend" class="">
        <legend class="" style="margin-left:-100px">请输入参数：</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">课程号</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_id'>
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">课程名</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_name'>
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">学分</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_Credit'>
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">学时</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_Hours'>
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">开课学院</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_XY'>
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">授课讲师</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name='course_T'>
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success">执行</button>
          </div>
        </div>

    </fieldset>
  </form>
</body>
</html>