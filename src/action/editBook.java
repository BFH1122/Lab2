package action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import SqlCon.mysql;

public class editBook {
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
	public void setPrice(double price)
	{
		this.price=price;
	}
	public double getPrice()
	{
		return price;
	}
	public String addedit()
	{
		mysql con=new mysql();
		String insert = "insert into author values("+getAuthorid()+",'"+getName()+"',"+getAge()+",'"+getCountry()+"');";
		
		con.executeUpdate(insert);
		//返回值，判断情况
		return "SUCCESS";
	}
	public String addbooks()
	{
		
		mysql con=new mysql();
		String insert = "insert into book values('"+getIsbn()+"','"+getTitle()+"','"+getPublisher()+"','"+getPublishDate()+"',"+getPrice()+","+getAuthorid()+");";
		con.executeUpdate(insert);
		System.out.println(insert);
		return "SUCCESS";
	}
	
	
	
	public String changen()
	{
		mysql con=new mysql();
		String ch = "update book set authorid="+getAuthorid()+",publisher='"+getPublisher()+"',publishDate='"+getPublishDate()+"',price="+getPrice()+" where isbn='"+getIsbn()+"';";
		con.executeUpdate(ch);
		return "SUCCESS";
	}
	
	//删除操作：
	public String delbook() throws SQLException
	{
		mysql con=new mysql();
		String r="select count(*) from book where authorid="+getAuthorid()+"";
		String del="delete from book where isbn='"+getIsbn()+"';";
		System.out.println(getIsbn());
		con.executeUpdate(del);
		int x=con.ececucount(r);
		if(x==0)
		{
			delauthor();
		}
		System.out.println(x);
		return "SUCCESS";
	}
	public String delauthor()
	{
		mysql con=new mysql();
		String del="delete from author where authorid="+getAuthorid()+";";
		System.out.println(del);
		con.executeUpdate(del);
		return "SUCCESS";
	}
}
