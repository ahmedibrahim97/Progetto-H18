<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
String msg=request.getParameter("param");
    

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">

        <title>CLASSI</title>
    </head>
    <body>
        <center>
            <div>
            
            <div>
            <table>
                <tr><h3>CLASSI</h3></tr>
              
               <%
               		
            
               		String[] pos=msg.split("/");
               		Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
                   	int num=1;
                	for(String s:servizio.stampaprezzi(Integer.parseInt(pos[0]),pr.getStazionepartenza(),pr.getStazionearrivo())){
                    	
                    	out.print("<tr><th>");
                    	out.print(s);
                    	out.print("</th>");
                    	out.print("<td>");
                    	
                    	out.print("<a  class=\"active\" href=\"Controller2?param="+ num +"/"+msg+"/"+s+"\">scelgo</a>");
                    	
                    	out.print("</td></tr>");
                   		num++;
                
                	}
               %>
                
            </table>
               </div>
        </center>
    </body>
</html>
