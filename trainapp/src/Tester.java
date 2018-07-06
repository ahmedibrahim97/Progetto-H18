
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;


public class Tester {
    
    
    public static void main(String args[]){
        
        HashMap<Integer,Tratta> strada=new HashMap();
        strada.put(1,new Tratta("GENOVA","PAVIA",20,95.5));
        strada.put(2,new Tratta("PAVIA","MILANO",25,75.4));
        strada.put(3,new Tratta("MILANO","MODENA",30,40.3));
        strada.put(4,new Tratta("MODENA","BOLOGNA",15,35.5));
        
        
        HashMap<Integer,Tratta> strada1=new HashMap();
        strada1.put(1,new Tratta("FIRENZE","TORINO",60,100));
        strada1.put(2,new Tratta("TORINO","MILANO",35,50));
        strada1.put(3,new Tratta("MILANO","PISA",25,43));
        strada1.put(4,new Tratta("PISA","VENEZIA",45,35));
        
        Itinerario linea1=new Itinerario("A",strada);
        Itinerario linea2=new Itinerario("B",strada1);
        
        
        Treno t=new Treno();
        t.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
        Treno t3=new Treno();
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,9));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
       /* t3.aggiungivagone(new Vagone(Tipologia.SECONDA_CUCETTA,16));
        t3.aggiungivagone(new Vagone(Tipologia.SECONDA_STANDARD,20));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,16));*/
        Treno t1=new Treno();
       /* t1.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t1.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));*/
        Treno t2=new Treno();
        t2.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t2.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
        
        
        Compagnia it=new Compagnia("Trenitalia");
        Compagnia fr=new Compagnia("Trenord");
        
        it.aggiungitreno(t);
        it.aggiungitreno(t3);
        fr.aggiungitreno(t1);
        fr.aggiungitreno(t2);
       
        
       Viaggio v=new Viaggio(t,linea2,new Date(118,6,2,9,00),Modalita.DIRETTO);
       Viaggio w=new Viaggio(t3,linea1,new Date(118,6,2,9,45),Modalita.INVERSO);
       Viaggio y=new Viaggio(t3,linea1,new Date(118,6,2,14,00),Modalita.INVERSO);
       Viaggio x=new Viaggio(t,linea2,new Date(118,6,2,17,30),Modalita.DIRETTO);
        
        
       Viaggio vo=new Viaggio(t1,linea2,new Date(118,6,2,18,00),Modalita.DIRETTO);
       Viaggio wo=new Viaggio(t2,linea1,new Date(118,6,2,15,30),Modalita.INVERSO);
        
       it.aggiungiviaggio(v);
       it.aggiungiviaggio(w);
       it.aggiungiviaggio(y);
       it.aggiungiviaggio(x);
       
       fr.aggiungiviaggio(vo);
       fr.aggiungiviaggio(wo);
       
       it.setprezzo(Tipologia.PRIMA_STANDARD, 0.17);
       it.setprezzo(Tipologia.PRIMA_CUCCETTA, 0.20);
       it.setprezzo(Tipologia.SECONDA_STANDARD,0.05);
       it.setprezzo(Tipologia.SECONDA_CUCETTA, 0.15);
       
       fr.setprezzo(Tipologia.PRIMA_STANDARD, 0.20);
       fr.setprezzo(Tipologia.PRIMA_CUCCETTA, 0.40);
       fr.setprezzo(Tipologia.SECONDA_STANDARD, 0.12);
       fr.setprezzo(Tipologia.SECONDA_CUCETTA, 0.17);
    
       ArrayList<Compagnia> c=new ArrayList();
       c.add(fr);
       c.add(it);
       
       ArrayList<Itinerario> I=new ArrayList();
       I.add(linea1);
       I.add(linea2);
       
       
       
       Servizioferrovario servizio=new Servizioferrovario(c,I);
       
       Prenotazione pr=new Prenotazione("MODENA","MILANO",new Date(118,6,2));
       Prenotazione pr1=new Prenotazione("MODENA","GENOVA",new Date(118,6,2));
       
       servizio.checktreno(pr);
       
       
       servizio.stampaprezzi(3, pr);
       
       servizio.visualizzaposti(1);
       
       System.out.println(servizio.prenotaposti("9A", pr));
       
       servizio.checktreno(pr1);
       
       servizio.stampaprezzi(2, pr1);
       
       servizio.visualizzaposti(2);
       
      // System.out.println(servizio.prenotaposti("9A", pr1));
       
       
      
     
    
    }
    
}
