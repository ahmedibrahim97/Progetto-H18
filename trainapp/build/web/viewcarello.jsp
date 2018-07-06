<%-- 
    Document   : viewcarello
    Created on : 5 juil. 2018, 00:29:29
    Author     : QUENTIN
--%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    servizio.getPreno().setNumadulti(servizio.getPreno().getNumadulti()-1);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>carello</title>
    </head>
    <body>
        <center><h1>Posto Aggiunto!!!</h1></center>
        <%
            out.print("<div>");
            out.print("<table>");
            if(servizio.getPreno().getNumadulti()>0){
            
               /* out.print("<tr><td>");
                out.print("<a href=\"viewposti2.jsp?param="+"love"+"\"><h1>continua</h1></a>");
                out.print("</td><td>");
                out.print("<a href=\"viewposti2.jsp?param="+"love"+"\"><h1>annula</h1></a>");
                out.print("</td></tr>");*/
            
            }
          /*  else{
                out.print("<tr><td>");
                out.print("<a href=\"viewposti2.jsp?param="+"love"+"\">prenota</a>");
                out.print("</td></tr>");
            }*/
            out.print("</table>");
            out.print("</div>");
        %>
    </body>
</html>
