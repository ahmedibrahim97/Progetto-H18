<%-- 
    Document   : trans2
    Created on : 11 juil. 2018, 10:23:18
    Author     : QUENTIN
--%>
<%@page import="Model.*"%>
<jsp:useBean id="servizio" class="Model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg=request.getParameter("param");
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    pr.setNumadulti((Integer)session.getAttribute("num"));
    session.getAttribute("num");
    session.setAttribute("msg",msg);
    Viaggio v=servizio.getV2();
    servizio.getPosti().clear();
    
    
    if(v!=null){
        
        response.sendRedirect("viewposto1.jsp");
    }
    else{
    
        response.sendRedirect("viewposti.jsp");
    
    }



%>
