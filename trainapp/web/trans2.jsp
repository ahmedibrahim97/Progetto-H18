<%-- 
    Document   : trans2
    Created on : 11 juil. 2018, 10:23:18
    Author     : QUENTIN
--%>
<%@page import="Controller.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String msg=request.getParameter("param");
  
    session.setAttribute("msg",msg);
    Viaggio v=servizio.getV2();
    
    if(v!=null){
        response.sendRedirect("viewposto1.jsp");
    }
    else{
    
        response.sendRedirect("viewposti.jsp");
    
    }








%>
