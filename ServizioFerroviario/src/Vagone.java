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

public class Vagone {

    private int totposto;
    private TipologiaVagone tipologia;
    private String id;
    private ArrayList<Posto> posti;

    public Vagone(int totposto, TipologiaVagone tipologia, String id) {
        this.totposto = totposto;
        this.tipologia = tipologia;
        this.id = id;
        this.posti = new ArrayList<>(totposto);
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

    public boolean generaPosti() { // GENERA TANTI POSTI QUANTI SONO IL TOTALE DEI POSTI DEL VAGONE
        Posto p;
        int i;
        for (i = 0; i < totposto; i++) {
            p = new Posto(Integer.toString(i));
            posti.add(p);
        }
        return true;
    }

    public boolean aggiungiPosti(String i) { // AGGIUNGE UN SINGOLO POSTO
        Posto p;
        p= new Posto(i);
        return posti.add(p);
    }


    @Override
    public String toString() {
        int i;
        String s = "";
        /* Stampa le iniziali della classe vicino al posto
         switch(tipologia)
         {
         case PRIMACUCCETTA: for(i=0; i<posti.size(); i++)
         {
         if(i % 2 ==0)
         s+="PC"+posti.get(i).toString()+ "\t";
         if(i % 2 !=0)
         s+="PC"+posti.get(i).toString()+ "\n";
         }
         break;
         case PRIMASTANDARD: for(i=0; i<posti.size(); i++)
         {
         if(i % 2 ==0)
         s+="PS"+posti.get(i).toString()+ "\t";
         if(i % 2 !=0)
         s+="PS"+posti.get(i).toString()+ "\n";
         }
         break;
         case SECONDACUCCETTA:for(i=0; i<posti.size(); i++)
         {
         if(i % 2 ==0)
         s+="SC"+posti.get(i).toString()+ "\t";
         if(i % 2 !=0)
         s+="SC"+posti.get(i).toString()+ "\n";
         }
         break;
         case SECONDASTANDARD: for(i=0; i<posti.size(); i++)
         {
         if(i % 2 ==0)
         s+="SS"+posti.get(i).toString()+ "\t";
         if(i % 2 !=0)
         s+="SS"+posti.get(i).toString()+ "\n";
         }
         break;
         }
         */
        for (i = 0; i < posti.size(); i++) {
            if (i % 2 == 0) {
                s += this.id + posti.get(i).toString() + "\t";
            }
            if (i % 2 != 0) {
                s += this.id + posti.get(i).toString() + "\n\n";
            }
        }

        return "Vagone " + id + "\nClasse vagone: " + tipologia + "\nTotale posti: " + totposto + "\n" + s + "\n";
    }

}
