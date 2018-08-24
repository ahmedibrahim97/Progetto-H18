package model;

/**
 * 
 *classe che permette di istanziare uno vagone che potrà essere aggiunto alla lista dei vagoni da cui è composto un determinato treno
 * 
 */

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class Vagone {
    
    private ArrayList<Posto> posti;
    private Tipologia  tipo;
    private int numeroposti;
    private int numvagone;

    /**
     * 
     * @param tipo  classe del vagone
     * @param numeroposti numero di posti contenuti nel vagone
     */
    public Vagone(Tipologia tipo,int numeroposti) {
        this.posti = new ArrayList();
        this.tipo = tipo;
        this.numeroposti=numeroposti;
        this.numvagone=0;
                
       
    
    }

    public int getNumvagone() {
        return numvagone;
    }

    public void setNumvagone(int numvagone) {
        this.numvagone = numvagone;
    }
    
    

    public ArrayList<Posto> getPosti() {
        return posti;
    }

    public Tipologia getTipo() {
        return tipo;
    }

    public int getNumeroposti() {
        return numeroposti;
    }
    
    
    
    public void denominazioneposti(int num){
        
        int i;
        
        
            for(i=num+1;i<=num+numeroposti;i++){
                
                if(tipo==Tipologia.PRIMA_CUCCETTA){
                    posti.add(new Posto(i+"B"));
                }
                if(tipo==Tipologia.PRIMA_STANDARD){
                    posti.add(new Posto(i+"A"));
                }
                 if(tipo==Tipologia.SECONDA_CUCCETTA){
                    posti.add(new Posto(i+"D"));
                }
                 if(tipo==Tipologia.SECONDA_STANDARD){
                    posti.add(new Posto(i+"C"));
                }
            
        
            }
    }
    
}
