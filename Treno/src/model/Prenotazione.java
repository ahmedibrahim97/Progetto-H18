package model;


import java.util.Date;


public class Prenotazione {
    
    private String stazionepartenza;
    private String stazionearrivo;
    private Date datapartenza;
    private Date dataritorno;
    private OPZIONE opzione;
    private int numadulti;

    public Prenotazione(String stazionepartenza, String stazionearrivo, Date datapartenza, Date dataritorno) {
        this.stazionepartenza = stazionepartenza;
        this.stazionearrivo = stazionearrivo;
        this.datapartenza = datapartenza;
        this.dataritorno = dataritorno;
        this.numadulti=0;
     
    }

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

    public OPZIONE getOpzione() {
        return opzione;
    }

    public int getNumadulti() {
        return numadulti;
    }
    
    @Override
    public String toString() {
        return stazionepartenza+"  ->  "+stazionearrivo+"\t"+datapartenza;
    }

    public void setOpzione(OPZIONE opzione) {
        this.opzione = opzione;
    }

    public void setNumadulti(int numadulti) {
        this.numadulti = numadulti;
    }
    
    
    
        
    
    
    
    
}
