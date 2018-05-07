import java.util.HashMap;

public class Itinerario {
    private HashMap<Integer , Tratta> tratte; //la chiave indica l'ordine di percorrenza delle tratte

    public Itinerario(HashMap<Integer, Tratta> tratte) {
        this.tratte = tratte;
    }
}
