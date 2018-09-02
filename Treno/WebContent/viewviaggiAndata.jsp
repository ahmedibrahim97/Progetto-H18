
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    Prenotazione pr1=new Prenotazione(pr.getStazionepartenza(),pr.getStazionearrivo(),pr.getDatapartenza());
    Prenotazione pr2=new Prenotazione(pr.getStazionearrivo(),pr.getStazionepartenza(),pr.getDataritorno());
    boolean b=false;
    session.setAttribute("b",b);
  
   
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
      
        <title>ViaggiAndata</title>
    </head>
    <body>
        <center><h1>Soluzioni Viaggio Andata:</h1></center>
        <center>
            <table>
        <%
        	boolean bool=true;
        	try{
        		
        		if(servizio.checktreno(pr1).length==0 || servizio.checktreno(pr2).length==0){
        			out.print("<center><p><h1>");
		            out.print(" Nessuna soluzione di viaggio trovata");
		            out.print("</h1></p>");
		            out.print("<p><a href=\"index.jsp\">torna alla homepage<a/></p>");
		            out.print("</center>");
            		bool=false;
            	}
            	int num=1;
            	if(bool){
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
            	}
        	}catch(Exception ex){
        		response.sendRedirect("Controller5");
        	}
                
              
           
       %>
        </table>
        </center>
    </body>
</html>
