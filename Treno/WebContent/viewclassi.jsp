<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String msg=request.getParameter("param").toString();
	String[] pos=msg.split("/");
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    
    

%>

<html>
    <head>
            <meta charset="UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="style2.css">
    
        <title>CLASSI</title>
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


<div class="immagine">



</div>


       <div class="panel panel-default"> 
           <div class="panel-heading">Scegli la classe</div> 
           			 <table class="table"> 
                        <thead> 
                        <tr> 
                        <th>#</th> 
                        <th>Classe</th>
                         <th>Dettagli</th>
                       
                        </tr> </thead> 
                        	<tbody>
         
            
          
               
              
               <%
                   int num=1;
                for(String s:servizio.stampaprezzi(Integer.parseInt(pos[0]),pr.getStazionepartenza(),pr.getStazionearrivo())){
                    
                	out.print("<tr><th scope = \"row\">"+num+"</th>");
                    String[] separazione=s.split(":");
                    out.print("<td>"+separazione[0]+"</td>");
                  
              %>
             <td>
              <div class="btn-group">
  				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   					 DETTAGLI <span class="caret"></span>
 				</button>
  					<ul class="dropdown-menu">
    					<li><%
    					 out.print("<a href=\"Controller2?param="+ num +"/"+msg+"/"+s+"\">");
    		 				 out.print(separazione[1]);
    
   										 %>
   							 </a></li>

   						<li role="separator" class="divider"></li>
    					<li><a href="#">Nessun dettaglio al momento</a></li>
  					</ul>
				</div>
              </td>
<%                  
   
                   
                    out.print("  </div> ");
                    
                   		out.print("</tr>");
                    num++;
                
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
