package com.Student;

import java.sql.*;

import com.sun.java_cup.internal.runtime.Scanner;

import Admin.Admininformation;

public class tool {
	//返回1为登录成功，返回0为登录失败，返回-1为系统异常
		String URL = "jdbc:sqlserver://localhost:1433;DatabaseName=firstSystem;characterEncoding=UTF-8";
		String USER = "sa";
		String PWD = "123456";
		static Connection connection = null;
		static PreparedStatement stmt = null;
		static ResultSet rs = null;
		
		
		//查询函数
		public ResultSet select(String sql)throws SQLException, NullPointerException, ClassNotFoundException{
		    try {
		    	connection = DriverManager.getConnection(URL, USER, PWD);
		    	stmt = connection.prepareStatement(sql);
		    	rs = stmt.executeQuery();
		    }catch (Exception e) {
		    	e.printStackTrace();
		    	System.out.println("系统异常");
		    	return null;
		    }
		    	return rs;    
		}
		
		
		
		//更新数据
		public int update(String sql)throws SQLException, NullPointerException, ClassNotFoundException{
		    try {
		    	connection = DriverManager.getConnection(URL, USER, PWD);
		    	stmt = connection.prepareStatement(sql);
		    	int count = stmt.executeUpdate();
				return count;
		    }catch (Exception e) {
		    	e.printStackTrace();
		    	return -1;
		    }
			
		}
		//关闭资源
		public static void close(){
		    try {
		    	rs.close();
		    	stmt.close();
		    	connection.close();		    	
		    } catch (SQLException e) {
		    	e.printStackTrace();
		    }
		}
		
		
		//普通用户登录
		public int StudentLogin(Studentinformation information) throws SQLException, NullPointerException, ClassNotFoundException  {
			try {
				//// a.导入数据库驱动
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				//// 建立连接
				connection = DriverManager.getConnection(URL, USER, PWD);
				//执行sql
				String login_sql = "select count(*) from student where username=? and password=?";
				stmt = connection.prepareStatement(login_sql);
				stmt.setString(1, information.getUsername());
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
			}
		}
		
		//管理员登录
		public int AdminLogin(Admininformation information) throws SQLException, NullPointerException, ClassNotFoundException  {
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
			}
		}
		
		
		//获取普通用户名
		public String GetName(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			String sql = "select Student_Name from Student where username ='" + username + "'";
			ResultSet rs = select(sql);
			String nickname = null;
			while(rs.next()) {
				nickname = rs.getString("Student_Name");	
			}
			return nickname;
		}
		
		//获取管理员名
		public String AdminGetName(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			String sql = "select nickname from Admin where adminname ='" + username + "'";
			ResultSet rs = select(sql);
			String nickname = null;
			while(rs.next()) {
				nickname = rs.getString("nickname");	
			}
			return nickname;
		}
		
		//返回个人基本信息
		public ResultSet Getinformation(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			String sql = "select * from Student where username = '" + username + "'";
			tool tool = new tool();
			rs = tool.select(sql);
			return rs;
			
		}
		
		//返回SC表信息
		public ResultSet GetSCinformation(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			String sql = "select * from SC where Student_ID = (select Student_ID from Student where username ='" + username + "')";
			tool tool = new tool();
			rs = tool.select(sql);
			
			return rs;
		}
		
		//返回Course表信息
		public ResultSet GetCourseinformation(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			tool tool = new tool();
			ResultSet rs = tool.GetSCinformation(username);					//获取SC表
			ResultSet crs = null;
			while(rs.next()) {
				String C_ID = rs.getString(2);								//先从SC表中获取C_ID
				String sql = "select * from Course where C_ID = '" + C_ID + "'";
				crs = tool.select(sql);	
			}
			return crs;
		}
			
			
		//返回Teacher表信息
			public ResultSet GetTeacherinformation(String username) throws NullPointerException, ClassNotFoundException, SQLException {
				tool tool = new tool();
				String sql = "select * from Course c left JOIN Student s on c.C_ID = s.C_ID right join Teacher t on c.T_ID = t.T_ID where username = '" + username +"'";
				ResultSet Trs = tool.select(sql);
				
				return Trs;	
				
		}
			
		//返回XueYuan表信息
		public ResultSet GetXueYuaninformation(String username) throws NullPointerException, ClassNotFoundException, SQLException {
			tool tool = new tool();
			ResultSet rs = tool.GetSCinformation(username);
			ResultSet XYrs = null;
			while(rs.next()) {
				String XY_ID = rs.getString(4);
				String sql = "select * from XueYuan where XY_ID = '" + XY_ID + "'";
				 XYrs = tool.select(sql);
				
			}
			return XYrs;
			
			
		}
		
		public static void main(String[] args) {
			

}
}
