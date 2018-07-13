<%-- 
    Document   : trans4
    Created on : 12-lug-2018, 21.14.57
    Author     : pc
--%>

<%@page import="Controller.*"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.Prenotazione"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    boolean b=(boolean)session.getAttribute("b");
    
    if(pr.getDataritorno()!=null && b==false){
        b=true;
        response.sendRedirect("viaggiRitorno.jsp");
    }
   
    else{
        response.sendRedirect("index.jsp");
    }

%>