package Admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Admin.Admininformation;

public class Login {
	public int login(Admininformation information) throws SQLException {	
		String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=firstSystem";
		String USER = "sa";
		String PWD = "123456";
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			//// a.导入数据库驱动
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//// 建立连接
			connection = DriverManager.getConnection(URL, USER, PWD);
			//执行sql
			String login_sql = "select count(*) from Admin where adminname=? and password=?";
			stmt = connection.prepareStatement(login_sql);
			stmt.setString(1, information.getAdminname());
			stmt.setString(2, information.getPassword());
			rs = stmt.executeQuery();
			int count = -1;
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {										
			if(rs!=null) {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			
			if (connection != null) {
				connection.close();
			}
		}
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
