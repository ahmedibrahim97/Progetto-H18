<%-- 
    Document   : trans5
    Created on : 13-lug-2018, 9.45.55
    Author     : pc
--%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="servizio" class="Model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    Prenotazione pr1=new Prenotazione(pr.getStazionepartenza(),pr.getStazionearrivo(),pr.getDatapartenza());
    Prenotazione pr2=new Prenotazione(pr.getStazionearrivo(),pr.getStazionepartenza(),pr.getDataritorno());
    boolean b=false;
    session.setAttribute("b",b);
    int i=0,j=0;
   
    for(String s:servizio.checktreno(pr2)){
        if(s!=null){
            i++;
        }
    }
    for(String s:servizio.checktreno(pr1)){
        if(s!=null){
            j++;
        }
    }
    if(i==0||j==0){
        out.print("<center><h1>nessuna soluzione di viaggio trovata</h1><center>");
    }
    else{
        response.sendRedirect("viewviaggiAndata.jsp");
    
    }
    
   

%>