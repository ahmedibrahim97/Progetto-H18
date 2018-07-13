<%-- 
    Document   : trans5
    Created on : 13-lug-2018, 9.45.55
    Author     : pc
--%>
<%@page import="Controller.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    Prenotazione pr1=new Prenotazione(pr.getStazionepartenza(),pr.getStazionearrivo(),pr.getDatapartenza());
    Prenotazione pr2=new Prenotazione(pr.getStazionearrivo(),pr.getStazionepartenza(),pr.getDataritorno());
    
    String[] v1=servizio.checktreno(pr1);
    String[] v2=servizio.checktreno(pr2);
    int i=0;
    
    for(String s:v1){
        
        for(String t:v2){
        
            if(servizio.getStazioneincroccio()!=null){
                if(t!=null){
                if(s.split("_")[2].equals(t.split("_")[2])){
                    i++;
                }
                }
            }    
            if(servizio.getStazioneincroccio()==null){
                if(t!=null){
                if(s.split("_")[1].equals(t.split("_")[1])){
                    i++;
                }
                }
                 
            }
         
        
        
        
    }
        
    }
    
 out.print(i);
    






%>