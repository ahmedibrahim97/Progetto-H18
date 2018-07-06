<%-- 
    Document   : viewviaggi
    Created on : 2 juil. 2018, 09:26:06
    Author     : QUENTIN
--%>

<%@page import="Controller.Tester"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.Prenotazione"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String stp=request.getParameter("partenza");
    String sta=request.getParameter("arrivo");
    String[] datap=request.getParameter("dataAndata").split("/");
   // String[] datar=request.getParameter("dataRitorno").split("/");
    Date dp=new Date(Integer.parseInt(datap[2])-1900,Integer.parseInt(datap[1]),Integer.parseInt(datap[0]));
   // Date dr=new Date(Integer.parseInt(datar[2])-1900,Integer.parseInt(datar[1]),Integer.parseInt(datar[0]));

    String mod=request.getParameter("modalita");
    Tester t=new Tester();
    t.inits();
    servizio.setCompagnie(t.getCompagnie());
    servizio.setItinerari(t.getI());
    
    Prenotazione pr=new Prenotazione(stp,sta,dp);
    pr.setNumadulti(Integer.parseInt(request.getParameter("numeroadulti")));
    servizio.setPreno(pr);


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viaggi</title>
    </head>
    <body>
    <center><h3> VIAGGI CORRISPONDENTI<h3/><center/>
    <center>  
      <table>  <%
                    int num=1;
                    for(String s:servizio.checktreno(servizio.getPreno())){
                    
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
