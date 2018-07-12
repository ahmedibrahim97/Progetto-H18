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
        <title>CLASSI</title>
    </head>
    <body>
        <center>
            <h3>CLASSI</h3>
            <div align="center" valign="middle">
            <table>
              
               <%
                   int num=1;
                for(String s:servizio.stampaprezzi(Integer.parseInt(pos[0]),pr.getStazionepartenza(),pr.getStazionearrivo())){
                    
                    out.print("<tr><td><th>");
                    out.print(s);
                    out.print("</th></td>");
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
