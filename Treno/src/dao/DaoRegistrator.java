package dao;
/**
 * classe che esegue un thread permettendo di registrare dei posti prenotati.
 * @author laurence
 */

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoRegistrator extends Thread{
	
	private DaoFactory Dao;
	private String CodViaggio;
	private String stp;
	private String sta;
	private String pt;
	

	/**
	 * costruttore
	 * @param Dao
	 */
	public DaoRegistrator(DaoFactory Dao){
		super();
		this.Dao=Dao;
		
	}
	
	@Override
	public void run(){
		
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("insert into REGISTRO(CODVIAGGIO,STAZIONEP,STAZIONEA,POSTO)VALUES('%s','%s','%s','%s')",
                         CodViaggio,stp,sta,pt);
            st.executeUpdate(query);
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
        }
		
		
		
	}

	public void setCodViaggio(String codViaggio) {
		CodViaggio = codViaggio;
	}

	public void setStp(String stp) {
		this.stp = stp;
	}

	public void setSta(String sta) {
		this.sta = sta;
	}

	public void setPt(String pt) {
		this.pt = pt;
	}
	
	
}
