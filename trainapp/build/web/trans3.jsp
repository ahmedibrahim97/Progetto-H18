<%-- 
    Document   : trans3
    Created on : 11 juil. 2018, 11:00:57
    Author     : QUENTIN
--%>
<%@page import="Controller.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    String posto=(String)session.getAttribute("posto");
    servizio.getPosti().add(posto);
    
    
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