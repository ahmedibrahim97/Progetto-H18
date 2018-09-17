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
    double num=0;
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css">
   		 <link rel="stylesheet" href="carrelloStyle.css">

        <title>Carello</title>
    </head>
    <body>
    
    <!-- menu -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">TrenoApp</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
           <li class="active"><a href="tracking.jsp">Track <span class="sr-only">(current)</span></a></li>
            </ul>
                </li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
    
        <center><h1>Biglietti</h1></center>
    <center>
    <div class="box">
      
        
        <%
        	
        	if(servizio.getStazioneincroccio()==null){
        		out.print("<p>"+msg.split("/")[5]+"</p>");
            	out.print(msg.split("/")[2]+">>>>"+msg.split("/")[3]+" "+msg.split("/")[4]);
            	out.print("<p>");
            	out.print(msg.split("/")[6].split(":")[0]);
            	out.print("</p>");
            	num=Double.parseDouble(msg.split("/")[6].split(":")[1].split("euros")[0]);
            }
        	else if(servizio.getStazioneincroccio()!=null){
        		out.print("<p>"+msg.split("/")[8]+"</p>");
        		out.print(msg.split("/")[2]+">>>>"+msg.split("/")[6]+" "+msg.split("/")[4].split("-")[0]+"-"+msg.split("/")[7].split("-")[1]);
            	out.print("<p>");
            	out.print(msg.split("/")[9].split(":")[0]);
            	out.print("</p>");
            	num=Double.parseDouble(msg.split("/")[9].split(":")[1].split("euros")[0]);
        	}
       %>
     
        <table>
   
            <%
                
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
            <div class="box">
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
        
         
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>   
    </body>
    
    
</html>
