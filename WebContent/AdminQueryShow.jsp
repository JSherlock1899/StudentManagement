<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/css/bootstrap-theme.min.css">

        <script src="https://cdn.bootcss.com/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/js/bootstrap-select.min.js"></script>
        <link href="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.min.css" rel="stylesheet">

        <style>
            .bs-docs-home
            {
            background-color: #1B31B1;
            background-image: url(line.png);
            }
    </style>   
</head>
<body>
	
	<body class="bs-docs-home" style="background:#fff;">
    <div class="container theme-showcase">
        <h1 style=" line-height:2em;"> </h1><br />
	</div>
        <div class="row">
            <div class="col-sm-3"></div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>查询界面</strong></h3>
                </div>
                <div class="panel-body">
                       <form action="UserQuery.jsp" method="post" target="select_frame">
                           <div class="form-group">
                               <label for="IDCard">请选择查询方式：</label>
                                 <select name="student" class="selectpicker" data-style="btn-info">
                                      <option value="1">按学号查询学生信息</option>
                                      <option value="2">按姓名查询学生信息</option>
                                      <option value="3">按性别查询学生信息</option>
                                      <option value="4">按联系方式查询学生信息</option>
                                      <option value="5">按班级查询学生信息</option>
                                      <option value="6">按民族查询学生信息</option>
                                </select>
                           </div>

                           <div class="form-group">
                               <label for="tiaojian">请输入查询值</label>
                               <div class="input-group">
                                   <input type="text"  name="tiaojian" class="form-control" id="Subject"  >
                                   <div class="input-group-btn">                               
                                       <input type="submit"  value="查询" class="btn btn-info">
                                   </div>
                               </div>
                           </div>
                       </form>
                 </div> 
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
</body>
</html>