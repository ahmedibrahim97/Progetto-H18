
<%@page import="model.*"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    servizio=(Servizioferroviario)session.getAttribute("servizio");
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");

    

%>
<html>
    <head>
       <meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
        <title>viaggi</title>
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

            </ul>
           

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!-- carosello -->
<div id="carousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active" style="background-image: url(Images/treno2.jpg);">

            <div class="carousel-caption">
                <h1>Scegli il tuo viaggio...</h1>
            </div>
        </div>
        <div class="item" style="background-image: url(Images/treno1.jpg);">

            <div class="carousel-caption">
                <h1>Scegli il tuo viaggio...</h1>
            </div>
        </div>
        <div class="item" style="background-image: url(Images/treno6.jpg);">

            <div class="carousel-caption">
                <h1>Scegli il tuo viaggio...</h1>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
    
    <a href="viewviaggi.jsp"></a>
 
       <div class="panel panel-default"> 
           <div class="panel-heading">Viaggi Corrispondenti</div> 
           			 <table class="table"> 
                        <thead> 
                        <tr> 
                        <th>#</th> 
                        <th>Partenza</th>
                        <th>Arrivo</th> 
                        <th>cambio</th>
                        <th>Stazione cambio</th>
                        <th>Compagnia</th>
		                <th>Scegli</th>
                        </tr> </thead> 
                        	<tbody>
                        
   <%
   			
   					
   					
   					if(servizio.checktreno(pr).length==0){
   						out.print("<center><p><h1>");
		               	out.print("Nessuna soluzione di viaggio disponibile");
		               	out.print("</h1></p>");
		               	out.print("</center>");
		             
   					}
                    int num=1;
   				
                    if(servizio.getStazioneincroccio()==null){
                    	for(String s:servizio.checktreno(pr)){
                    	
                        	if(s!=null){
                        		out.print("<tr><th scope = \"row\">"+num+"</th>");
                        		String[] separazione=s.split("/");
                        		out.print("<td>"+separazione[0]+" "+separazione[2].split("-")[0]+"</td>");
                        		out.print("<td>"+separazione[1]+" "+separazione[2].split("-")[1]+"</td>");
								out.print("<td>"+"   0  "+"</td>");
								out.print("<td>"+"  --  "+"</td>");
                        		out.print("<td>"+separazione[3]+"</td>");
                        		out.print("<td><button  type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='viewclassi.jsp?param="+ num+"/"+s+"'\">Scegli</button></td>");
                        		out.print("</tr>");
                        		num++;
                        	}
                    
                    	}
                  	}
                    else{
                    	for(String s:servizio.checktreno(pr)){
                        	
                        	if(s!=null){
                        		out.print("<tr><th scope = \"row\">"+num+"</th>");
                        		String[] separazione=s.split("/");
                        		out.print("<td>"+separazione[0]+" "+separazione[2].split("-")[0]+"</td>");
                        		out.print("<td>"+separazione[4]+" "+separazione[5].split("-")[1]+"</td>");
								out.print("<td>"+" "+ 1+" "+"</td>");
								out.print("<td>"+servizio.getStazioneincroccio()+" "+separazione[2].split("-")[1]+"-"+separazione[5].split("-")[0]+"</td>");
                        		out.print("<td>"+separazione[6]+"</td>");
                        		out.print("<td><button  type=\"button\" class=\"btn btn-primary\" onclick=\"location.href='viewclassi.jsp?param="+ num+"/"+s+"'\">Scegli</button></td>");
                        		out.print("</tr>");
                        		num++;
                        	}
                        	
                    
                    	}
                    }
                    
   				
                    
                  
                    
                        
                %>
                </tbody>
                        </table> 
                        </div>
       
      
   
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>
    </body>
</html>
