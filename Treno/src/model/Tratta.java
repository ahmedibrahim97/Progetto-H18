package model;


public class Tratta {
    
    private String Stazione1;
    private String Stazione2;
    private int durata;
    private double lunghezza;

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
