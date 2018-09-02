package model;

/**
 * classe che permette di istanziare una linea ferroviaria
 * 
 * @author laurence
 */


import java.util.HashMap;

import java.util.Map;


public class Itinerario {
    
 
    private Map<Integer,Tratta> tratte;
    private String nome;
    
    /**
     * 
     * @param tratte mappa contenente le tratte da cui è composto l'itinerario.
     */
    public Itinerario(Map<Integer, Tratta> tratte) {

        this.tratte=new HashMap();
        this.tratte = tratte;
    }
    
    

    public Map<Integer, Tratta> getTratte() {
        return tratte;
    }
    
    

    /**
     * metodo permettendo di verificare se una stazione è contenuta nell'itinerario
     * @param stazione
     * @return
     */
    public int controllostazione(String stazione){
    
        int i;
        
        for(i=1;i<=tratte.size();i++){
        
            if(tratte.get(i).getStazione1().equals(stazione))
                return i;
            else if(tratte.get(i).getStazione2().equals(stazione))
                return i;
        
        }
    
        return 0;
    }
    
    /**
     * metodo per il calcolo della durata del percorso tra 2 stazioni
     * @param st1
     * @param st2
     * @return ritorna il valore della durata del percorso tra st1 e st2
     */
    public int calcolodurata(String st1,String st2){
    
    int i,j,b1,b2,somma=0;
    String temp;
    
    b1=controllostazione(st1);
    b2=controllostazione(st2);
    
    if(st1.equals(st2)){
    
        return 0;
    
    }
    
    if(b2<b1){
        temp=st1;
        st1=st2;
        st2=temp;
    }
    else if(b2==b1 && st1.equals(tratte.get(b2).getStazione2())){
        temp=st1;
        st1=st2;
        st2=temp;
    
    }
    
        for(i=1;i<=tratte.size();i++){
        
            if(tratte.get(i).getStazione1().equals(st1)){
            
                somma+=tratte.get(i).getDurata();
                if(!(tratte.get(i).getStazione2().equals(st2))){
                
                    for(j=i+1;j<=tratte.size();j++){
                        
                        somma+=tratte.get(j).getDurata();
                    
                        if(tratte.get(j).getStazione2().equals(st2))
                            return somma;
                    }
                }
                return somma;
            
            }
                
        }
        
        return 0;
    }
    
    
    /**metodo per il calcola della distanza tra 2 stazioni
     * @param st1
     * @param st2
     * @return ritorna il valore della distanza tra st1 2 st2
     */
    public double calcololunghezza(String st1,String st2){
        
    int i,j,b1,b2;
    String temp;
    double somma=0.0;
    
    b1=controllostazione(st1);
    b2=controllostazione(st2);
    
    if(st1.equals(st2)){
    
        return 0;
    
    }
    
    if(b2<b1){
        temp=st1;
        st1=st2;
        st2=temp;
        
    }
    else if(b2==b1 && st1.equals(tratte.get(b2).getStazione2())){
        temp=st1;
        st1=st2;
        st2=temp;
    
    }
    
        for(i=1;i<=tratte.size();i++){
        
            if(tratte.get(i).getStazione1().equals(st1)){
            
                somma+=tratte.get(i).getLunghezza();
                if(!(tratte.get(i).getStazione2().equals(st2))){
                
                    for(j=i+1;j<=tratte.size();j++){
                        
                        somma+=tratte.get(j).getLunghezza();
                    
                        if(tratte.get(j).getStazione2().equals(st2))
                            return somma;
                    }
                }
                return somma;
            
            }
                
        }
        
        return 0;
    }
    
 
    
    /** metodo che determina il verso di percorrenza dell'itinerario
     * @param st1
     * @param st2
     * @return ritorna il verso di percorrenza dell'itinerario quando si và da st1 a st2
     */
    public Modalita checkmodalita(String st1,String st2){
        
        int i,b1,b2;
        
        b1=controllostazione(st1);
        b2=controllostazione(st2);
        
        if(st1.equals(st2)){
            return null;
        }
        
        if(b1<b2){
                return Modalita.DIRETTA;
        }       
        
        else if(b1>b2){
            return Modalita.INVERSA;
        }
        
        else if(b1==b2 && tratte.get(b1).getStazione1().equals(st1)){
            return Modalita.DIRETTA;
        }
        return Modalita.INVERSA;
    }


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}
    
    
}
