<%-- 
    Document   : ntrans6
    Created on : 13-lug-2018, 22.31.13
    Author     : pc
--%>

<%@page import="Model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="servizio" class="Model.Servizioferroviario" scope="session" />
<!DOCTYPE html>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    Prenotazione pr1=new Prenotazione(pr.getStazionearrivo(),pr.getStazionepartenza(),pr.getDataritorno());
    session.setAttribute("pr",pr1);
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
                border: 1px solid black;
                border-radius: 5px;
                background-color: lightslategray;
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
        <title>ViaggiRitorno</title>
    </head>
    <body>
        <center><h1>Soluzioni Viaggio Ritorno</h1></center>
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
        </div>
    </body>
</html>
