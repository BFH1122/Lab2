package SqlCon;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class mysql {
    Connection con =null;
    Statement stat=null;
    ResultSet rs=null;
    public mysql()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");//连接驱动
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","123456");//连接数据库
            stat=con.createStatement(); 
        }catch(Exception e)
        {
            con=null;
        }
    }
    public ResultSet executeQuery(String sql)
    {
        try
        { 
            rs=stat.executeQuery(sql);
        }
        catch(Exception e)
        {
            rs=null;
        }
        return rs;
    }
    public int ececucount(String sql)
    {
    	PreparedStatement pstmt = null;  
        ResultSet rs = null;  
        int count = 0;  
        try  
        {
            pstmt = con.prepareStatement(sql);  
            rs = pstmt.executeQuery();  
            while(rs.next())
            {  
                count = rs.getInt(1); 
            }  
            return count;
        }
        catch(Exception e)
        {
            return -1;
        }
    }
    public int executeUpdate(String sql)
    {
        try
        {
        	stat.executeUpdate(sql);
            return 0;
        }
        catch(Exception e)
        {
            return -1;
        }
    }
}
