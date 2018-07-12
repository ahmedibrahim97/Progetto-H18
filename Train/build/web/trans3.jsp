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
        //out.print(servizio.getV1().getRegistro().checkposto("3A", pr.getStazionepartenza(),pr.getStazionearrivo(),servizio.getV1().getPercorso(),servizio.getV1().getModalita()));
       
    }
    if(servizio.getV2()!=null){
        int i=servizio.returncompagnia(servizio.getV1().getCodviaggio().split("-")[0]);
        int j=servizio.getCompagnie().get(i).returnviaggio(servizio.getV1().getCodviaggio());
        servizio.getCompagnie().get(i).getViaggi().get(j).getRegistro().aggiungiriservazione(posto.split("/")[0],pr.getStazionepartenza(),servizio.getStazioneincroccio());
        int k=servizio.returncompagnia(servizio.getV2().getCodviaggio().split("-")[0]);
        int l=servizio.getCompagnie().get(i).returnviaggio(servizio.getV2().getCodviaggio());
        servizio.getCompagnie().get(k).getViaggi().get(l).getRegistro().aggiungiriservazione(posto.split("/")[1],servizio.getStazioneincroccio(),pr.getStazionearrivo());
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