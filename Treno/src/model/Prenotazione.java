package model;

/**
 * classe che permette di istanziare una nuova prenotazione
 * @author laurence
 */


import java.util.Date;


public class Prenotazione {
    
    private String stazionepartenza;
    private String stazionearrivo;
    private Date datapartenza;
    private Date dataritorno;
    private int numadulti;

    /**
     * costruttore
     * @param stazionepartenza
     * @param stazionearrivo
     * @param datapartenza
     * @param dataritorno
     */
    public Prenotazione(String stazionepartenza, String stazionearrivo, Date datapartenza, Date dataritorno) {
        this.stazionepartenza = stazionepartenza;
        this.stazionearrivo = stazionearrivo;
        this.datapartenza = datapartenza;
        this.dataritorno = dataritorno;
        this.numadulti=0;
     
    }

    /**
     * costruttore
     * @param stazionepartenza
     * @param stazionearrivo
     * @param datapartenza
     */
    public Prenotazione(String stazionepartenza, String stazionearrivo, Date datapartenza) {
        this.stazionepartenza = stazionepartenza;
        this.stazionearrivo = stazionearrivo;
        this.datapartenza = datapartenza;
    }

    public String getStazionepartenza() {
        return stazionepartenza;
    }

    public String getStazionearrivo() {
        return stazionearrivo;
    }

    public Date getDatapartenza() {
        return datapartenza;
    }

    public Date getDataritorno() {
        return dataritorno;
    }

    public int getNumadulti() {
        return numadulti;
    }
    
    @Override
    public String toString() {
        return stazionepartenza+"  ->  "+stazionearrivo+"\t"+datapartenza;
    }

 
    public void setNumadulti(int numadulti) {
        this.numadulti = numadulti;
    }
    
    
    
        
    
    
    
    
}
