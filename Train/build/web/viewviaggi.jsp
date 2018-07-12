
<%@page import="Controller.Tester"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.Prenotazione"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    Tester t=new Tester();
    t.inits();
    servizio.setCompagnie(t.getCompagnie());
    servizio.setItinerari(t.getI());
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viaggi</title>
    </head>
    <body>
    <center><h3> VIAGGI CORRISPONDENTI</h3></center>
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
