package Controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;


public class Tester {
    
    private  ArrayList<Compagnia> compagnie;
    private  ArrayList<Itinerario> I;
    
    
    public Tester(){
        
        this.compagnie=new ArrayList();
        this.I=new ArrayList();
       
        
    }    
        
    public void inits(){
        compagnie.clear();
        I.clear();
        
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
        t.aggiungivagone(new Vagone(Tipologia.SECONDA_STANDARD,15));
        t.aggiungivagone(new Vagone(Tipologia.SECONDA_CUCETTA,12));
        Treno t3=new Treno();
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,9));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
        t3.aggiungivagone(new Vagone(Tipologia.SECONDA_CUCETTA,16));
        t3.aggiungivagone(new Vagone(Tipologia.SECONDA_STANDARD,20));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t3.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,16));
        Treno t1=new Treno();
        t1.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t1.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
        Treno t2=new Treno();
        t2.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
        t2.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,10));
        t2.aggiungivagone(new Vagone(Tipologia.PRIMA_CUCCETTA,10));
        t2.aggiungivagone(new Vagone(Tipologia.SECONDA_STANDARD,10));
        
        
        Compagnia it=new Compagnia("Trenitalia");
        Compagnia fr=new Compagnia("Trenord");
        
        it.aggiungitreno(t);
        it.aggiungitreno(t3);
        fr.aggiungitreno(t1);
        fr.aggiungitreno(t2);
       
        
       Viaggio v=new Viaggio(t,linea2,new Date(118,8,2,9,00),Modalita.DIRETTO);
       Viaggio w=new Viaggio(t3,linea1,new Date(118,8,2,9,45),Modalita.INVERSO);
       Viaggio y=new Viaggio(t3,linea1,new Date(118,8,2,14,00),Modalita.DIRETTO);
       Viaggio x=new Viaggio(t,linea2,new Date(118,8,2,17,30),Modalita.DIRETTO);
       
       Viaggio v1=new Viaggio(t,linea2,new Date(118,8,3,9,00),Modalita.INVERSO);
       Viaggio w1=new Viaggio(t3,linea1,new Date(118,8,3,9,45),Modalita.DIRETTO);
       Viaggio y1=new Viaggio(t3,linea1,new Date(118,8,3,18,00),Modalita.INVERSO);
       Viaggio x1=new Viaggio(t,linea2,new Date(118,8,3,16,30),Modalita.INVERSO);
        
        
        
       Viaggio vo=new Viaggio(t1,linea2,new Date(118,8,2,18,00),Modalita.DIRETTO);
       Viaggio wo=new Viaggio(t2,linea1,new Date(118,8,2,15,00),Modalita.INVERSO);
       Viaggio vo1=new Viaggio(t1,linea2,new Date(118,8,3,18,00),Modalita.INVERSO);
       Viaggio wo1=new Viaggio(t2,linea1,new Date(118,8,3,15,00),Modalita.INVERSO);
        
       it.aggiungiviaggio(v);
       it.aggiungiviaggio(w);
       it.aggiungiviaggio(y);
       it.aggiungiviaggio(x);
       it.aggiungiviaggio(v1);
       it.aggiungiviaggio(w1);
       it.aggiungiviaggio(y1);
       it.aggiungiviaggio(x1);
       
       fr.aggiungiviaggio(vo);
       fr.aggiungiviaggio(wo);
       fr.aggiungiviaggio(vo1);
       fr.aggiungiviaggio(wo1);
       
       
       it.setprezzo(Tipologia.PRIMA_STANDARD, 0.17);
       it.setprezzo(Tipologia.PRIMA_CUCCETTA, 0.20);
       it.setprezzo(Tipologia.SECONDA_STANDARD,0.05);
       it.setprezzo(Tipologia.SECONDA_CUCETTA, 0.15);
       
       fr.setprezzo(Tipologia.PRIMA_STANDARD, 0.20);
       fr.setprezzo(Tipologia.PRIMA_CUCCETTA, 0.40);
       fr.setprezzo(Tipologia.SECONDA_STANDARD, 0.12);
       fr.setprezzo(Tipologia.SECONDA_CUCETTA, 0.17);
    
       ArrayList<Compagnia> c=new ArrayList();
       compagnie.add(fr);
       compagnie.add(it);
       
    
       I.add(linea1);
       I.add(linea2);
       
      
  
    
    }

    public ArrayList<Compagnia> getCompagnie() {
        return compagnie;
    }

    public ArrayList<Itinerario> getI() {
        return I;
    }
    
 
       
}
