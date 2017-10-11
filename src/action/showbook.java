package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import SqlCon.DbUtil;
import SqlCon.mysql;

public class showbook {
	private int authorid;
	private String name;
	private int age;
	private String country;
	
	private String isbn;
	private String title;
	//private int authorid;
	private String publisher;
	private String publishdate;
	//private int price;
	private double price;
	
	public void setAuthorid(int authorid)
	{
		this.authorid=authorid;
	}
	public int getAuthorid()
	{
		return authorid;
	}
	public void setName(String name)
	{
		this.name=name;
	}
	public String getName()
	{
		return name;
	}
	public void setAge(int age)
	{
		this.age=age;
	}
	public int getAge()
	{
		return age;
	}
	public void setCountry(String country)
	{
		this.country=country;
	}
	public String getCountry()
	{
		return country;
	}
//book类
	public void setIsbn(String isbn)
	{
		this.isbn=isbn;
	}
	public String getIsbn()
	{
		return isbn;
	}
	public void setTitle(String title)
	{
		this.title=title;
	}
	public String getTitle()
	{
		return title;
	}
	public void setPublisher(String publisher)
	{
		this.publisher=publisher;
	}
	public String getPublisher()
	{
		return publisher;
	}
	public void setPublishDate(String publishdate)
	{
		this.publishdate=publishdate;
	}
	public String getPublishDate()
	{
		return publishdate;
	}
	public void setPrice(double Price)
	{
		this.price=price;
	}
	public double getPrice()
	{
		return price;
	}
	public String shows() throws SQLException, IOException
	{
		ResultSet rs=null;
		mysql con=new mysql();
		String insert="select * from author a inner join book b on a.authorid=b.authorid where name='"+getName()+"';";
		rs=con.executeQuery(insert);
		HttpServletResponse response=ServletActionContext.getResponse(); 
		String result="[";
		String r="";
		while(rs.next()){
			result=result+"{"+"\"authorid\":"+"\""+rs.getString(1)+"\""+","+"\""+"name\":"+"\""+rs.getString(2)+"\""+","+"\"age\":"+"\""+rs.getString(3)+"\""
					+","+"\"country\":"+"\""+rs.getString(4)+"\""+","+"\"isbn\":"+"\""+rs.getString(5)+"\""+","+"\"title\":"+"\""+rs.getString(6)+"\""+","
					+"\"publisher\":"+"\""+rs.getString(7)+"\""+","+"\"publishDate\":"+"\""+rs.getString(8)+"\""+","+"\"price\":"+"\""+rs.getString(9)+"\""+"}"+",";
		}
		r=result.substring(0,result.length()-1);
		r=r+"]";
		System.out.println(r+"这是什么");
		response.setContentType("text/html;charset=utf-8");  
	    PrintWriter out = response.getWriter(); 
	    out.println(r);  
	    out.flush();  
	    out.close(); 
		return "SUCCESS";
	}
	@SuppressWarnings("resource")
	public String show() throws SQLException, IOException {
		ResultSet rs=null;
		mysql con=new mysql();
		String in="select * from author a inner join book b on a.authorid=b.authorid";
		rs=con.executeQuery(in);
	
		HttpServletResponse response=ServletActionContext.getResponse(); 
		String result="[";
		String r="";
		while(rs.next()){
			result=result+"{"+"\"authorid\":"+"\""+rs.getString(1)+"\""+","+"\""+"name\":"+"\""+rs.getString(2)+"\""+","+"\"age\":"+"\""+rs.getString(3)+"\""
					+","+"\"country\":"+"\""+rs.getString(4)+"\""+","+"\"isbn\":"+"\""+rs.getString(5)+"\""+","+"\"title\":"+"\""+rs.getString(6)+"\""+","
					+"\"publisher\":"+"\""+rs.getString(7)+"\""+","+"\"publishDate\":"+"\""+rs.getString(8)+"\""+","+"\"price\":"+"\""+rs.getString(9)+"\""+"}"+",";
		}
		r=result.substring(0,result.length()-1);
		r=r+"]";
		System.out.println(r);
		response.setContentType("text/html;charset=utf-8");  
	    PrintWriter out = response.getWriter(); 
	    out.println(r);  
	    out.flush();  
	    out.close(); 
		return "SUCCESS";
	}
}
