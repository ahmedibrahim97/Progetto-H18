<%-- 
    Document   : view
    Created on : 13-lug-2018, 16.40.32
    Author     : pc
--%>
<%@page import="Controller.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    Prenotazione pr1=new Prenotazione(pr.getStazionepartenza(),pr.getStazionearrivo(),pr.getDatapartenza());
    




%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViaggiAndata</title>
    </head>
    <body>
        <center><h1>Viaggi Andata</h1></center>
        <div align="center">
            <table>
        <%
            int num=1;
            for(String s:servizio.checktreno(pr1)){
                
                
                    if(s!=null){
                        out.print("<tr><td>");
                        out.print(s);
                        out.print("</td><td>");
                        out.print("<a href=\"viewclassi.jsp?param="+ num+"/"+s+"\">scelgo <a/>");
                        out.print("</td></tr>");
                        num++;
                    }
            }
                
              
           
       %>
        </table>
        </div>
    </body>
</html>
