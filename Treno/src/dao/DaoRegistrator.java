package dao;
/**
 * classe che esegue un thread permettendo di registrare dei posti prenotati.
 * @author laurence
 */

import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;

public class DaoRegistrator{
	
	private DaoFactory Dao;


	/**
	 * costruttore
	 * @param Dao
	 */
	public DaoRegistrator(DaoFactory Dao){
		super();
		this.Dao=Dao;
		
	}
	
	
	public void uploadregistro(String CodViaggio,String stp,String sta,String pt,String prenotazione){
		
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("insert into REGISTRO(CODVIAGGIO,STAZIONEP,STAZIONEA,POSTO,PRENOTAZIONE)VALUES('%s','%s','%s','%s','%s')",
                         CodViaggio,stp,sta,pt,prenotazione);
            st.executeUpdate(query);
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
        }
		
	
	}
	
	public void uploadprenotazioni(String preno,String descr,String mod){
		
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("insert into PRENOTAZIONI(ID_PRENOTAZIONE,DESCRIZIONE,MODALITA)VALUES('%s','%s','%s')",
                        preno,descr,mod);
            st.executeUpdate(query);
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
        }
		
	
	}
	
public void uploadprenotazioni_posto(String preno,String pt,String mod){
		
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("insert prenotazioni_posto(ID_PRENOTAZIONE,POSTO,MODALITA)VALUES('%s','%s','%s')",
                        preno,pt,mod);
            st.executeUpdate(query);
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
        }
		
	
	}
	
}
