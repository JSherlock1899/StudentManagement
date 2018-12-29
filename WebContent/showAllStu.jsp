<%@page import="java.sql.ResultSet"%>
<%@page import="com.Student.tool"%>
<%@page import="poi.Export"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/table.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    $(".delete").live("click",function(e){
        var Student_ID = $(e.target).closest("tr").find(".Student_ID").text();
        $.ajax({
            url:"student/deleteStu.jsp",
            type:"get",
            datatype:"json",
            data:{
                "Student_ID" : Student_ID
            },
            success : function(msg){
                if(msg){
                    alert("删除成功");
                    $(e.target).closest("tr").fadeOut();
                }
                else{
                    alert("删除失败");
                }
            },
            error:function(msg){  
                alert('ajax请求出现错误...');  
            }
        });
    });
    
    
    // 判断当前状态是编辑还是保存
    $('.updata').live("click",function(e){
    	var content = $(this).text();
    	if(content == "保存"){
    		$('.updata').addClass('save');
    	}else{
    		$('.updata').removeClass('save');
    	}
    })
    
    
    $('.save').live("click",function(e){
    	var Student_ID = $(this).closest("tr").find(".Student_ID").text();
    	var Student_Name = $(this).closest("tr").find(".Student_Name").text();
    	var Phone = $(this).closest("tr").find(".Phone").text();
    	var Gender = $(this).closest("tr").find(".Gender").text();
    	var BirthDate = $(this).closest("tr").find(".BirthDate").text();
    	var Nation = $(this).closest("tr").find(".Nation").text();
    	var JiGuan = $(this).closest("tr").find(".JiGuan").text();
    	var ClassID = $(this).closest("tr").find(".ClassID").text();
    	
    	
        $.ajax({
            url:"student/changeStu.jsp",
            type:"get",
            datatype:"json",
            data:{
                "Student_ID" : Student_ID,
                "Student_Name" : Student_Name,
                "Phone" :Phone,
                "Gender" : Gender,
                "BirthDate" :BirthDate,
                "Nation" :Nation,
                "JiGuan" :JiGuan,
                "ClassID" :ClassID,
            },
            success : function(result){
                if(result){
                    alert("修改成功");
                }
                else{
                    alert("修改失败");
                }
            },
            error:function(result){  
                alert('ajax请求出现错误...');  
            }
        });
    });
    
    

 
 
    //动态更改表格内的信息
    $(function(){
        $(".updata").click(function() {
            str = $(this).text()=="编辑"?"保存":"编辑";
            $(this).text(str);   // 按钮被点击后，在“编辑”和“确定”之间切换
            $(this).parent().siblings().each(function() {  // 获取单元格
                obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框
                if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以编辑
                    {
                		$(this).html("<input type='text' value='"+$(this).text()+"'>");
                		$(".table input").css("width","100px");
                    }
                else   // 如果已经存在文本框，则将其显示为文本框修改的值
                    $(this).html(obj_text.val());
            });
        });
    });
    
    //添加学生信息
    //添加表格行
    	
 		$("#btn1").live("click",function(){
 			var tr = "<tr><td><input type='checkbox' 	 name = 'select'></td>"+
 			"<td ><input type='text' class=Student_ID></td>" +
 			"<td><input type='text'  class=Student_Name></td>" +
 			"<td ><input type='text' class=Gender></td>" +
 			"<td><input type='text' class=BirthDate></td>" +
 			"<td ><input type='text' class=Nation></td>"+ 
 			"<td><input type='text' class=JiGuan></td>" +
 			"<td><input type='text' class=ClassID></td>"+
 			"<td><input type='text' class=Phone></td>"+
 			"<td><a class='delete'>删除</a><a class='saveNewMsg' >保存</a></td>"
 			"</tr>";
 			$("table").append(tr);//向table中追加tr
 		});
    
 		//获取新建行当前每个表格单元的信息
 		$('.saveNewMsg').live("click",function(){
 			var Student_ID = $(this).closest("tr").find("input[class='Student_ID']").val();
 			var Student_Name = $(this).closest("tr").find("input[class='Student_Name']").val();
 			var Gender = $(this).closest("tr").find("input[class='Gender']").val();
 			var BirthDate = $(this).closest("tr").find("input[class='BirthDate']").val();
 			var Nation = $(this).closest("tr").find("input[class='Nation']").val();
 			var JiGuan = $(this).closest("tr").find("input[class='JiGuan']").val();
 			var ClassID = $(this).closest("tr").find("input[class='ClassID']").val();
 			var Phone = $(this).closest("tr").find("input[class='Phone']").val();
 			$.ajax({
 		        url:"student/saveNewStu.jsp",
 		        type:"get",
 		        datatype:"json",
 		        data:{
 		            "Student_ID" : Student_ID,
 		            "Student_Name" : Student_Name,
 		            "Gender" :Gender,
 		            "BirthDate" : BirthDate,
 		            "Nation" : Nation,
 		            "JiGuan" : JiGuan,
 		            "ClassID" :ClassID,
 		            "Phone" :Phone,
 		        },
 		        success : function(result){
 		                alert("修改成功");
 		        },
 		        error:function(result){  
 		            alert('请求出现错误...');  
 		        }
 		    });
 		});
 
		//实现全选与反选
		$(function(){
		$("#checkAll").click(function() {
			if (this.checked){
		        $("input[name=select]:checkbox").each(function(){
		              $(this).attr("checked", true);
		        });
		    } else {
		        $("input[name=select]:checkbox").each(function() {
		              $(this).attr("checked", false);
		        });
		    }
		});
		});
</script>
<title>Insert title here</title>
</head>
<body>
	
	<%
		
		tool tool = new tool();
		String sql = "select * from Student";
		ResultSet rs = tool.select(sql);
		out.print("<form action = 'selectExport' methods='post'><table border=2 class='table'>"+
    		      "<tr>"+
				"<th><input type='checkbox'  id='checkAll'/>全选</th>"+
    		        "<th>学号</th><th>姓名</th><th>性别</th><th>出生年月</th>"+
    		        "<th>民族</th><th>籍贯</th><th>班级</th><th>联系方式</th><th>执行操作</th>"+
    		      "</tr>");
		while(rs.next()){
			String Student_ID = rs.getString(1);
			String Student_Name = rs.getString(2);
			String Gender = rs.getString(3);
			String BirthDate = rs.getString(4);
			String Nation = rs.getString(5);
			String JiGuan = rs.getString(6);
			String ClassID = rs.getString(7);
			String Phone = rs.getString(11);
			
			out.print(
              		      "<tr>"+
							"<td><input type='checkbox' value = "+ Student_ID +" name = select></td>"+
              		        "<td class='Student_ID'>" + rs.getString(1) + "</td><td class='Student_Name'>" + rs.getString(2) + "</td><td class='Gender'>" + rs.getString(3) + "</td><td class='BirthDate'>" + rs.getString(4) + "</td>"+
              		    
            		        "<td class='Nation'>" + rs.getString(5) + "</td><td class='JiGuan'>" + rs.getString(6) + "</td><td class='ClassID'>" + rs.getString(7) + "</td><td class='Phone'>" + rs.getString(11) + "</td><td>"+
            		        "<a class='delete'>删除</a><a class='updata' >编辑</a>" +"</td>"
            		     + "</tr>");
		}
		//out.print("</table><input type='submit' value='将选中的学生信息导出为excel表格'></form>");
		
	%>
	
	<input type="button" value="添加学生信息" id="btn1" style="margin-bottom:10px"/>
	<a href="Export" style="text-decoration:none; margin-left:10px">导出为excel表格</a>

</body>
</html>