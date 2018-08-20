<%-- 
    Document   : trans4
    Created on : 12-lug-2018, 21.14.57
    Author     : pc
--%>

<%@page import="Model.*"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="servizio" class="Model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
   // boolean b=(boolean)session.getAttribute("b");
    
    if(pr.getDataritorno()!=null){
        boolean b=(boolean)session.getAttribute("b");
       if(b==false){
           b=true;
           response.sendRedirect("viaggiRitorno.jsp");
       }
    }
   
    else{
        //response.sendRedirect("temp.jsp");
    }

%>