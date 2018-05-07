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
}
