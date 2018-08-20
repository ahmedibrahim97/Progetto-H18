package dao;

import java.sql.*;

public class DaoFactory {
	
	static DaoFactory instance;
	private  String url;
	private String username;
	private String password;
	
	private DaoFactory(String url,String username,String password){
		this.url=url;
		this.username=username;
		this.password=password;
	}

	public static synchronized DaoFactory getInstance(){
		
		instance=new DaoFactory("jdbc:mysql://localhost:3306/servizioferroviario?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","maths");
		return instance;
		
	}
	
	public Connection getConnection() throws SQLException{
		
		return DriverManager.getConnection(url,username,password);
		
	}
	
	public DaoServiceInitializer getServiceInitializer(){
		
		return new DaoServiceInitializer(this);
		
	}
	
	public DaoRegistrator getDaoRegistrator(){
		
		return new DaoRegistrator(this);
	}
}
