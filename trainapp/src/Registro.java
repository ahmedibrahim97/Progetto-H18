
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;


public class Registro {
    
    
    private HashMap<Posto,ArrayList<Occupazione>> riservazioni;

    public Registro() {
        riservazioni=new HashMap();
    }

    public HashMap<Posto, ArrayList<Occupazione>> getRiservazioni() {
        return riservazioni;
    }
    
    
    public void tracciaposti(Treno t){
        int i,j;
        
        for(i=1;i<=t.getVagoni().size();i++){
        
            for(j=0;j<t.getVagoni().get(i).getPosti().size();j++){
            
                riservazioni.put(t.getVagoni().get(i).getPosti().get(j), new ArrayList());
            
            }
        }
    
    }
    
    public boolean registrazione(String pt,String stazionep,String stazionea,Itinerario it,Modalita m){
    
    int i,j;
        Iterator iter=riservazioni.keySet().iterator();
        
        for(i=0;i<riservazioni.size();i++){
        
            if(iter.next().toString().equals(pt)){
                
                  Posto p= (Posto)iter.next();
        
                if(riservazioni.get(p).isEmpty()){
                
                    riservazioni.get(p).add(new Occupazione(stazionep,stazionea));
                    System.out.println("posto trovato");
                    return true;
                }
                else{
            
                    for(i=0;i<riservazioni.get(p).size();i++){
                    
                        if(m==Modalita.DIRETTO){
                            if(it.controllostazione(stazionea)>it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                if(it.controllostazione(stazionep)<=it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                    System.out.println("Posto già occupato");
                                    return false;
                                } 
                            }
                            else if(it.controllostazione(stazionep)<it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                if(it.controllostazione(stazionep)>=it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                    System.out.println("Posto già occupato");
                                    return false;
                                }
                            }   
                        }   
                    
                        else if(m==Modalita.INVERSO){
                        
                            if(it.controllostazione(stazionea)<it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                if(it.controllostazione(stazionep)>=it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                    System.out.println("Posto già occupato");
                                    return false;
                                }   
                            } 
                            else if(it.controllostazione(stazionep)>it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                if(it.controllostazione(stazionea)<=it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                    System.out.println("Posto già occupato");
                                    return false;
                                } 
                            }
                        }        
                      
                    
                }
                
                riservazioni.get(p).add(new Occupazione(stazionep,stazionea));
                return true;
            }
        
        }
        
    }
    
   return false;
    }

}
