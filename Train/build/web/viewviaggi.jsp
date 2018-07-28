
<%@page import="Controller.Tester"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.Prenotazione"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");

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
                background-image:url(Images/treno3.jpg);
                background-repeat: no-repeat;
                background-position: center center;
                
            }
            
        </style>
        
        <title>viaggi</title>
    </head>
    <body>
    <center><h3> VIAGGI CORRISPONDENTI</h3></center>
    <a href="viewviaggi.jsp"></a>
    <center>  
      <table>  <%
                    int num=1;
                    for(String s:servizio.checktreno(pr)){
                    
                        if(s!=null){
                        out.print("<tr><td><th>");
                        out.print(s);
                        out.print("</th></td>");
                        out.print("<td>");
                        out.print("<a href=\"viewclassi.jsp?param="+ num+"/"+s+"\"> scelgo <a/>");
                        out.print("</td></tr>");
                        num++;
                        }
                    } 
                    
                    
                        
                %>
      </table> 
      
    </center>
    
    </body>
</html>
