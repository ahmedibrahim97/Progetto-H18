<%-- 
    Document   : carello
    Created on : 11 juil. 2018, 11:22:47
    Author     : QUENTIN
--%>
<%@page import="Controller.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String posto=(String)session.getAttribute("posto");
    out.print(posto);
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carello</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
