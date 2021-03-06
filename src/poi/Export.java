package poi;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.Student.Studentinformation;
import com.Student.tool;


public class Export extends HttpServlet {

 

			public void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
				String path = "D://学生信息表.xls";
				(new ExportExcel()).studentTest();
//				String str = "a.xls";
				//String path = request.getSession().getServletContext().getRealPath(str);
				download(path, response);
			}
			public void download(String path, HttpServletResponse response) {
				try {
					// path是指欲下载的文件的路径。
					File file = new File(path);
					// 取得文件名。
					String filename = file.getName();
					// 以流的形式下载文件。
					InputStream fis = new BufferedInputStream(new FileInputStream(file));
					byte[] buffer = new byte[fis.available()];
					fis.read(buffer);
					fis.close();
					
					// 设置response的Header
					response.addHeader("Content-Disposition", "attachment;filename="
							+ new String(filename.getBytes()));
					response.addHeader("Content-Length", "" + file.length());
					OutputStream toClient = new BufferedOutputStream(
							response.getOutputStream());
					response.setContentType("application/vnd.ms-excel;charset=gb2312");
					toClient.write(buffer);
					toClient.flush();
					toClient.close();
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
	

				


	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
