

<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        
        <title>viaggi</title>
    </head>
    <body>
    <center><h3> VIAGGI CORRISPONDENTI</h3></center>
    <a href="viewviaggi.jsp"></a>
    <center>  
      <table>  <%
      				
      				Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
      				if(servizio.checktreno(pr).length==0){
						out.print("<p><h3>Nessuna soluzione di viaggio trovata !!! </h3></p>");
						out.print("<p><a href=\"index.jsp\">torna alla homepage<a/></p>");
					}
                    
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
