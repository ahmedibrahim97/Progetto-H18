package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DaoCanceller {

	private DaoFactory Dao;
	/**
	 * costruttore
	 * @param Dao
	 */

	public DaoCanceller(DaoFactory Dao){
		super();
		this.Dao=Dao;
		
	}
	
	public  void deleteprenotazione(String Cod){
		try{
			Connection connection=Dao.getConnection();
            Statement st=connection.createStatement();
            String query=String.format("delete  from prenotazioni where ID_PRENOTAZIONE='%s' and MODALITA='ANDATA'",
                         Cod);
            st.executeUpdate(query);
            query=String.format("delete  from prenotazioni where ID_PRENOTAZIONE='%s' and MODALITA='RITORNO'",
                    Cod);
            st.executeUpdate(query);
            
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
            
        }
	}
}
