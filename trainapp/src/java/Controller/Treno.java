package Controller;


import java.util.HashMap;
import java.util.Map;


public class Treno {
    
    private String codice;
    private Map<Integer,Vagone> vagoni;
    private int numposti;

    public Treno() {
        this.vagoni =new HashMap();
        this.numposti=0;
        
        
    }

    public int getNumposti() {
        return numposti;
    }
    
    
    public void setCodice(String codice) {
        this.codice = codice;
    }
    
    

    public String getCodice() {
        return codice;
    }

    
    
    public Map<Integer, Vagone> getVagoni() {
        return vagoni;
    }
   
    public boolean aggiungivagone(Vagone v){
    
        v.denominazioneposti(numposti);
        vagoni.put(vagoni.size()+1, v);
        numposti=numposti+v.getNumeroposti();
        return false;
    
    }
   
}
