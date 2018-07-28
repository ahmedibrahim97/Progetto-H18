<%@page import="Controller.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String[] pos=request.getParameter("param").split("/");
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
                border-radius: 5px;
                
            }
            table{
              
                background-color: lavender;
                width: 65%;
            }
            body{
                -moz-background-size: cover;
                background-attachment: fixed;
                background-color: black;
                background-image:url(Images/treno1.jpg);
                background-repeat: no-repeat;
                background-position: center center;
                
            }
            
        </style>
        <title>CLASSI</title>
    </head>
    <body>
        <center
            <div>
            
            <div>
            <table>
                <tr><h3>CLASSI</h3></tr>
              
               <%
                   int num=1;
                for(String s:servizio.stampaprezzi(Integer.parseInt(pos[0]),pr.getStazionepartenza(),pr.getStazionearrivo())){
                    
                    out.print("<tr><th>");
                    out.print(s);
                    out.print("</th>");
                    out.print("<td>");
                    out.print("<a href=\"trans2.jsp?param="+ num +"/"+pos[1]+"/"+s+"\"> scelgo <a/>");
                    out.print("</td></tr>");
                    num++;
                
                }
               %>
                
            </table>
               </div>
        </center>
    </body>
</html>
