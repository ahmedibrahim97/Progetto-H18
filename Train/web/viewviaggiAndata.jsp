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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 10px;
            }
            div{
                
                width: 65%;
                
            }
            table{
                border-color: black;
                border: 1px;
                background-color: blanchedalmond;
                width: 60%
            }
            body{
                -moz-background-size: cover;
                background-attachment: fixed;
                background-color: black;
                background-image:url(Images/treno2.jpg);
                background-repeat: no-repeat;
                background-position: center center;
                
            }
            
        </style>
        <title>ViaggiAndata</title>
    </head>
    <body>
        <center><h1>Soluzioni Viaggio Andata</h1></center>
        <center>
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
        </center>
    </body>
</html>
