package SqlCon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * ���ݿ⹤������
 * */
public class DbUtil {

	private final static String URL = "jdbc:mysql://localhost:3306/java_mysql?characterEncoding=UTF-8";
	private final static String USER_NAME = "root";
	private final static String PASSWORD = "123456";

	/**
	 * ��ȡ����
	 * */
	public static Connection getConn() {
		Connection conn = null;
		 try
	        {
	            Class.forName("com.mysql.jdbc.Driver");//��������
	            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","123456");//�������ݿ�
	            
	        }catch(Exception e)
	        {
	            conn=null;
	        }
		return conn;
	}

	/**
	 * ִ�в�ѯ���
	 * */
	public static ResultSet query(Connection conn, String sql) {
		Statement stat=null;
	    ResultSet rs=null;        
		try
		        { 
		        	 stat=conn.createStatement(); 
		            rs=stat.executeQuery(sql);
		        }
		        catch(Exception e)
		        {
		            rs=null;
		        }
		        return rs;
		 	}

	/**
	 * ִ�и������
	 * */
	public static int exec(String sql) {
		Connection conn = null;
		try {
			conn = getConn();
			return conn.prepareStatement(sql).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, null, null);
		}
		return -1;
	}

	/**
	 * �ر�����
	 * */
	public static void close(Connection conn, Statement ps, ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (ps != null)
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}