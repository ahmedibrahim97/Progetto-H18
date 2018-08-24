
package model;

/**
 * la classe compagnia che permette di istanziare una nuova compagnia ferroviaria 
 * @author laurence
 * 
 */


import java.util.ArrayList;
import java.util.*;


public class Compagnia {
    
	
    private String nome;
    private HashMap<String,Treno> treni;
    private ArrayList<Viaggio> viaggi;
    private HashMap<Tipologia,Double> prezzi;

    /**
     * 
     * @param nome nome della compagnia
     */
    public Compagnia(String nome) {
        this.nome = nome;
        this.treni=new HashMap();
        this.viaggi=new ArrayList();
        this.prezzi=new HashMap();
    }

    public String getNome() {
        return nome;
    }

    public HashMap<String,Treno> getTreni() {
        return treni;
    }

    public ArrayList<Viaggio> getViaggi() {
        return viaggi;
    }
    
    
    public boolean aggiungitreno(Treno t){
    
       t.setCodice(nome+"-Treno"+treni.size());
       treni.put(t.getCodice(), t);
       return true;
       
    }

    
    /**
     * metodo che esegue all'interno di una compagnia una ricerca di viaggi
     * @param it Itinerario da percorrere
     * @param m  verso di percorrenza 
     * @param d  data 
     *      
     * @return ritorna un ArrayList di viaggi corrispondenti ai parametri ricevuti.
     */
    public ArrayList<Viaggio> checkviaggi(Itinerario it,Modalita m,Date d){
    
        ArrayList<Viaggio> v=new ArrayList();
        int i;
        
        for(i=0;i<viaggi.size();i++){
            if(viaggi.get(i).getData().getYear()==d.getYear() && viaggi.get(i).getData().getMonth()==d.getMonth()){
                if(viaggi.get(i).getData().getDay()==d.getDay()){
                	
                    if(viaggi.get(i).getPercorso().getNome().equals(it.getNome()) && viaggi.get(i).getModalita()==m){
                        
                            v.add(viaggi.get(i));
                        
                       
                    }
                
                }
            
            }
        }
        Collections.sort(v);
        return v;
    }
    
    public void setprezzo(Tipologia t,double pr){
        
        prezzi.put(t, pr);
    
    }

    public HashMap<Tipologia, Double> getPrezzi() {
        return prezzi;
    }
    
    
    /**
     * metodo per risalire ad un viaggio.
     * @param cod codice di un viaggio
     * @return ritorna l'indice del viaggio il cui codice coincide con la stringa ricevuta come parametro.
     */
    public int returnviaggio(String cod){
        int i;
        for(i=0;i<viaggi.size();i++){
            if(cod.equals(viaggi.get(i).getCodviaggio())){
                return i;
            }
        
        }
        return -1;
    }
}
