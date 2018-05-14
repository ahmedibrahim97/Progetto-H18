import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

public class Itinerario {
    private ArrayList<Tratta> tratte; //la chiave indica l'ordine di percorrenza delle tratte
    // ArrayList? -> luca

    public Itinerario() {
        this.tratte = new ArrayList<Tratta>();
    }

    public void addTratta(Tratta tratta){
        if(tratte.contains(tratta)){
            // gestisco eccezione
        }else{
            tratte.add(tratta);
        }
    }

    public Tratta getTratta(int codice){
        return tratte.get(codice-1);
    }

    public Date getDurataTotale(){
        Date durata = new Date();
        long temp = 0;
        for (int i=0;i<tratte.size();i++) {
            temp =+ tratte.get(i).getDurata().getTime();
        }
        durata.setTime(temp);
        return durata;
    }
}
