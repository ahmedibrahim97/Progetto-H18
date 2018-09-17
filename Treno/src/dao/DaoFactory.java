package dao;

import java.sql.*;

/**
 * classe che permette di creare una connessione con il database
 * @author laurence
 *
 */

public class DaoFactory {
	
	static DaoFactory instance;
	private  String url;
	private String username;
	private String password;
	
	/**
	 * costruttore
	 * @param url url del database
	 * @param username
	 * @param password
	 */
	private DaoFactory(String url,String username,String password){
		this.url=url;
		this.username=username;
		this.password=password;
	}

	
	/**
	 * @return un'istanza della DaoFactory
	 */
	public static synchronized DaoFactory getInstance(){
		
		instance=new DaoFactory("jdbc:mysql://localhost:3306/servizioferroviario?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","maths");
		return instance;
		
	}
	
	/**
	 * @return ritorna una connessione al database
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	public Connection getConnection() throws SQLException{
		
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

		return DriverManager.getConnection(url,username,password);
	
		
	}
	
	/**
	 * @return ritorna un'istanza della classe DaoServiceInitializer
	 */
	public DaoServiceInitializer getServiceInitializer(){
		
		return new DaoServiceInitializer(this);
		
	}
	
	/**
	 * @return ritorna un'istanza della classe DaoRegistrator
	 */
	public DaoRegistrator getDaoRegistrator(){
		
		return new DaoRegistrator(this);
	}
	
	
	public DaoTracker getDaoTracker(){
		
		return new DaoTracker(this);
	}
	
	public DaoCanceller getDaoCanceller(){
		return new DaoCanceller(this);
	}
}
