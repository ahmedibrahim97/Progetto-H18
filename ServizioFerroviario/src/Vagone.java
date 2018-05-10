import java.util.ArrayList;

public class Vagone {
    private int totposto;
    private TipologiaVagone tipologia;
    private String id;
    private ArrayList<Posto> posti;

    public Vagone(int totposto, TipologiaVagone tipologia, String id, ArrayList<Posto> posti) {
        this.totposto = totposto;
        this.tipologia = tipologia;
        this.id = id;
        this.posti = posti;
    }

    public int getTotposto() {
        return totposto;
    }

    public TipologiaVagone getTipologia() {
        return tipologia;
    }

    public String getId() {
        return id;
    }

    public String getPosti
}
