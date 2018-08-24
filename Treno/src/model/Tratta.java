package model;

/**
 * classe che permette di istanziare una nuova tratta  che potrà esser aggiunta ad un percorso
 * @author laurence
 *
 */

public class Tratta {
    
    private String Stazione1;
    private String Stazione2;
    private int durata;
    private double lunghezza;

    /**
     * 
     * @param Stazione1 prima stazione della tratta
     * @param Stazione2 seconda stazione della tratta
     * @param durata    tempo necessario per andare dalla Stazione1 alla Stazione2
     * @param lunghezza distanza tra la Stazione1 e la Stazione2
     */
    public Tratta(String Stazione1, String Stazione2, int durata,double lunghezza) {
        this.Stazione1 = Stazione1;
        this.Stazione2 = Stazione2;
        this.durata = durata;
        this.lunghezza=lunghezza;
    }

    public String getStazione1() {
        return Stazione1;
    }

    public double getLunghezza() {
        return lunghezza;
    }

    
    public String getStazione2() {
        return Stazione2;
    }

    public int getDurata() {
        return durata;
    }

    @Override
    public String toString() {
        return Stazione1+"--"+Stazione2+" : "+durata;
    }
    
    
}
