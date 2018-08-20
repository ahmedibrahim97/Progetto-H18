package DbConnection;

import Model.*;
import java.sql.*;
import java.text.*;
import java.util.Date;
import java.util.*;

/**
 *
 * @author pc
 */
public class DbConnector {
    
    private ArrayList<Compagnia> compagnie;
    private ArrayList<Itinerario> I;
    private Connection connection;
    
    
    public DbConnector(){
        
        Map<String,Itinerario> Iti= new HashMap();
        this.compagnie=new ArrayList();
        this.I=new ArrayList();
        
        try{
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/servizioferrovario?autoReconnect=true&useSSL=false","root","gagar5");
        Statement st=connection.createStatement();
        Statement st1=connection.createStatement();
        Statement st2=connection.createStatement();
        
 // CARICAMENTO DEI DIVERSI ITINERARI DEL SISTEMA FERROVIARIO     
        ResultSet rs1=st.executeQuery("select * from ITINERARI");
        while(rs1.next()){
            String linea=(rs1.getString(1));
            HashMap<Integer,Tratta> strada=new HashMap();
            String query=String.format("select * from Tratte where ITINERARI_NOME= '%s'",linea);
            ResultSet rs2=st1.executeQuery(query);
            while(rs2.next()){
            
                strada.put(rs2.getInt("NUMTRATTA"),new Tratta(rs2.getString("STAZIONE1"),rs2.getString("STAZIONE2"),rs2.getInt("DURATA"),rs2.getInt("LUNGHEZZA")));
            
            }
            Iti.put(linea,new Itinerario(strada));
            I.add(new Itinerario(strada));
        }
        
//CARICAMENTO DELLE DIVERSE COMPAGNIE
        rs1=st.executeQuery("select * from Compagnia");
        while(rs1.next()){
        String nome=rs1.getString("NOME");
        compagnie.add(new Compagnia(nome));
        
        }

        
        
//  CARICAMENTO DEI TRENI DEI VAGONI DA CUI SONO COMPOSTI        
        int k;
        for(k=0;k<compagnie.size();k++){
            String query=String.format("select * from Treno where COMPAGNIA_NOME='%s'",compagnie.get(k).getNome());
            rs1=st.executeQuery(query);
            while(rs1.next()){
                String cod=rs1.getString("CODTRENO");
                Treno t= new Treno();
                String sql=String.format("select * from Vagone where CODTRENO='%s'",cod);
                ResultSet rs2=st2.executeQuery(sql);
                while(rs2.next()){
                    int i;
                    for(i=0;i<Tipologia.values().length;i++){
                        if(rs2.getString("TIPOLOGIA").equals(Tipologia.values()[i].name())){
                            t.aggiungivagone(new Vagone(Tipologia.values()[i],rs2.getInt("NUMPOSTI")));
                        }
                    }
                }
                compagnie.get(k).aggiungitreno(t);
            }
        }
             
        
//  CARICAMENTO DEI PREZZI DELLE DIVERSE COMPAGNIE      
        int i;
        for(i=0;i<compagnie.size();i++){
            String nome=compagnie.get(i).getNome();
            String query=String.format("select * from PREZZI where COMPAGNIA_NOME='%s'", nome);
            rs1=st.executeQuery(query);
            while(rs1.next()){
                int j;
                for(j=0;j<Tipologia.values().length;j++){
                    if(rs1.getString("TIPOLOGIA").equals(Tipologia.values()[j].name())){
                            compagnie.get(i).getPrezzi().put(Tipologia.values()[j],rs1.getDouble("PREZZO"));
                    }
               }
            
            }
        }
        
//  CARICAMENTO DEI VIAGGI PROGRAMMATI DALLE DIVERSE COMPAGNIE

        for(i=0;i<compagnie.size();i++){
            
            String nome=compagnie.get(i).getNome();
            String query=String.format("select * from VIAGGIO where COMPAGNIA_NOME='%s'", nome);
            rs1=st.executeQuery(query);
            while(rs1.next()){
                String cod=rs1.getString("CODVIAGGIO");
                String treno=rs1.getString("TRENO_CODTRENO");
                String linea=rs1.getString("ITINERARI_NOME");
                String mod=rs1.getString("MODALITA");
                DateFormat str=new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date data=str.parse(rs1.getString("DATA_ORA"));
                Viaggio v;
                int j;
                for(j=0;j<Modalita.values().length;j++){
                    if(mod.equals(Modalita.values()[j].name())){
                       v=new Viaggio(compagnie.get(i).getTreni().get(treno),Iti.get(linea),data,Modalita.values()[j]);
                       v.setCodviaggio(cod);
                       String sql1=String.format("select * from registro where VIAGGIO_CODVIAGGIO='%s'",cod);
                       ResultSet rs2=st1.executeQuery(sql1);
                       while(rs2.next()){
                           String p=rs2.getString("POSTO");
                           String stp=rs2.getString("STAZIONEP");
                           String sta=rs2.getString("STAZIONEA");
                           v.getRegistro().aggiungiriservazione(p, stp, sta);
                           
                       }
                       compagnie.get(i).getViaggi().add(v);
                       
                    }
               }

            }
          
        }
       
        }
        catch(Exception e){
        
            System.out.println(e.getMessage());
        }
        
      
}

    public ArrayList<Compagnia> getCompagnie() {
        return compagnie;
    }

    public ArrayList<Itinerario> getI() {
        return I;
    }
    
    
    
    
    public void Dbregistrazione(String CodViaggio,String pt,String stp,String sta){
        
        try{
            Statement st=connection.createStatement();
            String query=String.format("insert into REGISTRO(VIAGGIO_CODVIAGGIO,STAZIONEP,STAZIONEA,POSTO)VALUES('%s','%s','%s','%s')",
                         CodViaggio,stp,sta,pt);
            st.executeUpdate(query);
        }
        catch(SQLException e){
            
            System.out.println(e.getMessage());
        }
        
        
    
    }
 
    
    
}
