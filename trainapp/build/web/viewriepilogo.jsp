<%-- 
    Document   : viewriepilogo
    Created on : 4 juil. 2018, 20:47:28
    Author     : QUENTIN
--%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String[] pos=request.getParameter("param").split("/");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Riepilogo</title>
    </head>
    <body>
        <div>
        <center>
        <h1>Riepilogo</h1>
        
        <table><%
            
                    
                    out.print("<tr><p>");
                    out.print(pos[3].split("_")[0]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print("POSTO: ");
                    out.print(pos[2]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print(pos[3].split("_")[1]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print("POSTO: ");
                    out.print(pos[0]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print(pos[4]);
                    out.print("</p></tr>");
               %>
        </table>
        </center>
        </div>
        <div>
            <form action="viewcarello.jsp"  >
                <center>
                    <table>
                        <tr>
                        <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="inserisci nel carello"></td>
                        </tr>
                    </table>    
                </center> 
           </form>    
        </div>
    </body>
</html>
