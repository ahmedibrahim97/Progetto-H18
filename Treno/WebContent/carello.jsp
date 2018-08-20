<%-- 
    Document   : carello
    Created on : 11 juil. 2018, 11:22:47
    Author     : QUENTIN
--%>
<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg=(String)session.getAttribute("msg");
    //out.print(msg);
    double num=0;
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

        <title>Carello</title>
    </head>
    <body>
        <center><h1>Biglietti</h1></center>
    <center>
    <div>
            <style>
            td{
                padding: 10px;
            }
            div{
                
                width: 70%;
                border: 1px solid black;
                border-radius: 5px;
                background-color: burlywood;
            }
            body{
                
                -moz-background-size: cover;
                background-attachment: fixed;
                background-color: black;
                background-image:url(Images/treno4.jpg);
                background-repeat: no-repeat;
                background-position: center center;;
            
            }
            
        </style>
        
        <%
            out.print(msg.split("/")[1]);
            out.print("<p>");
            out.print(msg.split("/")[2].split(":")[0]);
            out.print("</p>");
       %>
     
        <table>
   
            <%
                num=Double.parseDouble(msg.split("/")[2].split(":")[1].split("euros")[0]);
                out.print("<tr><td>");
                out.print("POSTI");
                out.print("</td><td>");
                out.print("PREZZO");
                out.print("</td><tr>");
                for(String s:servizio.getPosti()){
                    out.print("<tr><td>");
                    out.print(s);
                    out.print("</td>");
                    out.print("<td align=\"center\">");
                    out.print(num);
                    out.print("</td></tr>");
    
                
                }

            %>
        </table>
    </div>
    </center>
        <center>
            <div>
                <table>
                    <tr><th>
                    TOTALE    
                    </th>
                    <td>
                        <%out.print(servizio.getPosti().size()*num+" euros");%>
                    </td>    
                    </tr>
                </table>  
            </div> 
            <div>
            <table>
            <tr><td>          
            <form action="Controller4" method="POST" >     
            <input class="btn btn-success" type="submit" value="conferma">
            </form>
            </td><td>
            <form action=index.jsp>
            <input class="btn btn-success" type="submit" value="anulla">
            </form>
            </td></tr>
            </table>
            </div>
        </center>
        
            
    </body>
</html>
