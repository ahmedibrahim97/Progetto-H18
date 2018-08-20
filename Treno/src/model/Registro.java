package model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;


public class Registro {
    
    
    private HashMap<String,ArrayList<Occupazione>> riservazioni;

    public Registro() {
        riservazioni=new HashMap();
    }

    public HashMap<String, ArrayList<Occupazione>> getRiservazioni() {
        return riservazioni;
    }
    
    
    public void tracciaposti(Treno t){
        int i,j;
        
        for(i=1;i<=t.getVagoni().size();i++){
        
            for(j=0;j<t.getVagoni().get(i).getPosti().size();j++){
            
                riservazioni.put(t.getVagoni().get(i).getPosti().get(j).toString(), new ArrayList());
            
            }
        }
    
    }
    
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
    
    public void aggiungiriservazione(String p,String stp,String sta){
    
        riservazioni.get(p).add(new Occupazione(stp,sta));
     
    }
    
}
