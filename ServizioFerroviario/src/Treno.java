/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cl439380
 */
import java.util.ArrayList;
import java.util.HashMap;

public class Treno {

    private String id;
    private ArrayList<Vagone> vagoni;
    private Boolean occupato;
    private HashMap<TipologiaVagone, Float> costoPosti;

    public Treno(String id, Boolean occupato) {
        this.id = id;
        this.vagoni = new ArrayList<>();
        this.occupato = occupato;
        this.costoPosti = new HashMap<>();

    }

    public String getId() {
        return id;
    }

    public Boolean getOccupato() {
        return occupato;
    }

    public boolean addVagoni(Vagone v) {

        return vagoni.add(v);
    }

    public void impostaPrezzi(float PC, float PS, float SC, float SS) {
        costoPosti.put(TipologiaVagone.PRIMACUCCETTA, PC);
        costoPosti.put(TipologiaVagone.PRIMASTANDARD, PC);
        costoPosti.put(TipologiaVagone.SECONDACUCCETTA, PC);
        costoPosti.put(TipologiaVagone.SECONDASTANDARD, PC);

    }

    public float getPrezzo(TipologiaVagone tipo) {
        return this.costoPosti.get(tipo);
    }

    public String toString() {
        String s = "Treno: " + id + "\nStato: " + occupato + "\n\n";
        int i;
        for (i = 0; i < vagoni.size(); i++) {
            s += vagoni.get(i);
        }
        return s;
    }

}
