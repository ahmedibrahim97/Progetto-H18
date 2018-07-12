<%@page import="Controller.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    String posto=(String)session.getAttribute("posto");
    servizio.getPosti().add(posto);
    if(servizio.getV2()==null){
        
        int i=servizio.returncompagnia(servizio.getV1().getCodviaggio().split("-")[0]);
        int j=servizio.getCompagnie().get(i).returnviaggio(servizio.getV1().getCodviaggio());
        servizio.getCompagnie().get(i).getViaggi().get(j).getRegistro().aggiungiriservazione(posto,pr.getStazionepartenza(),pr.getStazionearrivo());
        
       
    }
    
    
     pr.setNumadulti(pr.getNumadulti()-1);

    
    if(pr.getNumadulti()==0){
    
        response.sendRedirect("carello.jsp");
    }

    if(pr.getNumadulti()>0){

       
       session.setAttribute("pr", pr);
       
       if(servizio.getV2()==null){
           response.sendRedirect("viewposti.jsp");
       }
       else{
           response.sendRedirect("viewposto1.jsp");
       }
    
    }




%>