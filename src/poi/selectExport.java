package poi;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Student.tool;


@WebServlet("/selectExport")
public class selectExport extends HttpServlet {

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ids = request.getParameterValues("select");
		ExportExcel<ExcelInformation> ex = new ExportExcel<ExcelInformation>();
		String[] headers =
		{ "学号", "用户名","姓名", "性别", "出生年月","民族","籍贯","班级","联系方式" };
		List<ExcelInformation> dataset = new ArrayList<ExcelInformation>();
		tool tool = new tool();
		for(int i=0;i<ids.length;i++) {
			String sql = "select * from Student where Student_Id = '" + ids[i] + "'";
			try {
				ResultSet rs = tool.select(sql);
				while(rs.next()) {
					dataset.add(new ExcelInformation(rs.getString(1),rs.getString(9),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(11)));				
					}
			}
			
			catch (NullPointerException | ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}finally{
				
			}
		}
		OutputStream out = new FileOutputStream("D://学生信息表表.xls");
		ex.exportExcel(headers, dataset, out);
		out.close();
//		String str = "a.xls";
		//String path = request.getSession().getServletContext().getRealPath(str);
		String path = "D://学生信息表.xls";
		Export export = new Export();
		export.download(path, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
		
	


