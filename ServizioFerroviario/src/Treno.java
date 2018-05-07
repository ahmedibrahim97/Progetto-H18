import java.util.ArrayList;
import java.util.HashMap;

public class Treno {
    private String id;
    private ArrayList<Vagone> vagoni;
    private Boolean occupato;
    private HashMap<TipologiaVagone, Float> costoPosti;

    public Treno(String id, ArrayList<Vagone> vagoni, Boolean occupato, HashMap<TipologiaVagone, Float> costoPosti) {
        this.id = id;
        this.vagoni = vagoni;
        this.occupato = occupato;
        this.costoPosti = costoPosti;
    }
}
