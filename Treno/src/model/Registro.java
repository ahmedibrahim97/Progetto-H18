package model;

/**
* classe che permmette di tenere traccia delle prenotazioni dei posti in un treno
* @author laurence
* 
*/

import java.util.ArrayList;
import java.util.HashMap;



public class Registro {
    
    
    private HashMap<String,ArrayList<Occupazione>> riservazioni;

   
    public Registro() {
        riservazioni=new HashMap();
    }

    public HashMap<String, ArrayList<Occupazione>> getRiservazioni() {
        return riservazioni;
    }
    
    
    /**
     * metodo che permette di tenere traccia delle prenotazioni fatte per ogni posti in un treno
     * @param t
     */
    public void tracciaposti(Treno t){
        int i,j;
        
        for(i=1;i<=t.getVagoni().size();i++){
        
            for(j=0;j<t.getVagoni().get(i).getPosti().size();j++){
            
                riservazioni.put(t.getVagoni().get(i).getPosti().get(j).toString(), new ArrayList());
            
            }
        }
    
    }
    
    /**
     * metodo permette di controllare la disponibilità di un posto.
     * @param pt
     * @param stazionep
     * @param stazionea
     * @param it
     * @param m
     * @return ritorna true se il posto è disponibile e false nel caso contrario 
     */
    public boolean checkposto(String pt,String stazionep,String stazionea,Itinerario it,Modalita m){
    
    int i,j;
    
        for(i=0;i<riservazioni.size();i++){
        
           
                
                String p= pt;
        
                if(riservazioni.get(p).isEmpty()){
                
                    return true;
                }
                else{
            
                    for(i=0;i<riservazioni.get(p).size();i++){
                    
                        if(m==Modalita.DIRETTA){
                            if(it.controllostazione(stazionea)>it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                if(it.controllostazione(stazionep)<=it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                    return false;
                                } 
                            }
                            else if(it.controllostazione(stazionep)<it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                if(it.controllostazione(stazionep)>=it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                    return false;
                                }
                            }   
                        }   
                    
                        else if(m==Modalita.INVERSA){
                        
                            if(it.controllostazione(stazionea)<it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                if(it.controllostazione(stazionep)>=it.controllostazione(riservazioni.get(p).get(i).getStazionepartenza())){
                                    return false;
                                }   
                            } 
                            else if(it.controllostazione(stazionep)>it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                if(it.controllostazione(stazionea)<=it.controllostazione(riservazioni.get(p).get(i).getStazionearrivo())){
                                    return false;
                                } 
                            }
                        }        
                      
                    
                }
                
               
                return true;
            }
        
        
        
    }
    
   return true;
}
    
    /**
     * metodo per l'aggiunta di una riservazione per un posto
     * @param p
     * @param stp
     * @param sta
     */
    public void aggiungiriservazione(String p,String stp,String sta){
    
        riservazioni.get(p).add(new Occupazione(stp,sta));
     
    }
    
}
