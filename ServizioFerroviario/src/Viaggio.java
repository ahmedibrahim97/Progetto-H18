import java.util.Date;

public class Viaggio {
    private Itinerario itin;
    private Treno treno;
    private Date dataOraP;
    private Date dataOraA;
    private Registro registro;
    private Modalita modalita;

    public Viaggio(Itinerario itin, Treno treno, Date dataOraP, Registro registro, Modalita modalita) {
        this.itin = itin;
        this.treno = treno;
        this.dataOraP = dataOraP;
        this.registro = registro;
        this.modalita = modalita;
        dataOraA.setTime(dataOraP.getTime() + itin.getDurataTotale().getTime());
    }

    public Date getDataOraP() {
        return dataOraP;
    }

    public Date getDataOraA() {
        return dataOraA;
    }
}
