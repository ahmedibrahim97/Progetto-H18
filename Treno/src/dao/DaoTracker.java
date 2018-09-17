package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoTracker {
	private DaoFactory Dao;
	/**
	 * costruttore
	 * @param Dao
	 */

	public DaoTracker(DaoFactory Dao){
		super();
		this.Dao=Dao;
		
	}
	
	
	public int checkcod(String cod){
		
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("select count(*) as NUM from prenotazioni where ID_PRENOTAZIONE='%s'",
                         cod);
            ResultSet rs=st.executeQuery(query);
            if(rs.next()){
            	return rs.getInt("NUM");
            }
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
            
        }
		return 0;
	}
	
	public String Trackprenotazione(String cod,String mod){
		
		try{
			Connection connection=Dao.getConnection();
			Statement st=connection.createStatement();
			String query=String.format("select DESCRIZIONE from prenotazioni where ID_PRENOTAZIONE='%s' and MODALITA='%s'",
                     cod,mod);
			ResultSet rs=st.executeQuery(query);
			if(rs.next()){
				return rs.getString("DESCRIZIONE");
			}
		}
		catch(SQLException e){
        
			System.out.println(e.getMessage());
        
		}
    		return null;	
	}
	
	public ArrayList<String> Trackposti(String cod,String mod){
		ArrayList<String> posti=new ArrayList<String>();
		try{
			Connection connection=Dao.getConnection();
			Statement st=connection.createStatement();
			String query=String.format("select POSTO from PRENOTAZIONI_POSTO where ID_PRENOTAZIONE='%s' and MODALITA='%s'",
                     cod,mod);
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				posti.add(rs.getString("POSTO"));
			}
			return posti;
		}
		catch(SQLException e){
        
			System.out.println(e.getMessage());
        
		}
    		return null;	
		
		
	}
	
	
	
}
