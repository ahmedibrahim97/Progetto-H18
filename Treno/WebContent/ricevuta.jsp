<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<%
    int k=(int)request.getSession().getAttribute("k");
	String Cod=(String)request.getSession().getAttribute("Cod");
	DaoFactory dao=(DaoFactory)request.getSession().getAttribute("dao");
	DaoTracker dt=dao.getDaoTracker();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     	 <link rel="stylesheet" href="css/bootstrap.min.css">
   		 <link rel="stylesheet" href="ricevutaStyle.css">
        
            
        <title>tracking</title>
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
    
    <div class="immagine">

	</div>
    
        <div>
        <center>
        <h2>Dettagli prenotazione <% out.print(Cod); %></h2>
        
        <p><%
            		if(k==2){
            			out.print("<h2>ANDATA</h2>");
            		}
            		
            		String msg=dt.Trackprenotazione(Cod,"ANDATA");
            		String spl[]=msg.split("/");
            		if(spl.length<10){
            			out.print("<p> COMPAGNIA: "+spl[5]+"</p>");
            			out.print("<p> DATA: "+spl[7]+"</p>");
            			out.print("<p> PARTENZA: "+spl[2]+" "+spl[4].split("-")[0]+"</p>");
            			out.print("<p> ARRIVO: "+spl[3]+" "+spl[4].split("-")[1]+"</p>");
            			out.print("<p> CAMBIO: 0</p>");
            			out.print("<p> CLASSE: "+spl[6].split(":")[0]+"</p>");
            			out.print("<p> POSTI:</p>");
            			
            			int i=1;
            			for(String s:dt.Trackposti(Cod,"ANDATA")){
            				out.print("<p>Posto"+i+":  "+s+"</p>");
            				i++;
            			}
            						
            			
            		}
            		if(spl.length>=10){
            			
            			out.print("<p> COMPAGNIA: "+spl[8]+"</p>");
            			out.print("<p> DATA: "+spl[10]+"</p>");
            			out.print("<p> PARTENZA: "+spl[2]+" "+spl[4].split("-")[0]+"</p>");
            			out.print("<p> ARRIVO: "+spl[6]+" "+spl[7].split("-")[1]+"</p>");
            			out.print("<p> CAMBIO: 1</p>");
            			out.print("<p> STAZIONE CAMBIO: "+spl[3]+" "+spl[4].split("-")[1]+"-"+spl[7].split("-")[0]+"</p>");
            			out.print("<p> CLASSE: "+spl[9].split(":")[0]+"</p>");
            			out.print("<p> POSTI: </p>");
            			
            			int i=1;
            			for(String s:dt.Trackposti(Cod,"ANDATA")){
            				out.print("<p>Posto"+i+":  "+s+"</p>");
            				i++;
            			}
            		}
            		
            	
        			if(k==2){
        				out.print("<h2>RITORNO</h2>");
        				msg=dt.Trackprenotazione(Cod,"RITORNO");
        				String spl1[]=msg.split("/");
        				if(spl1.length<10){
                			out.print("<p> COMPAGNIA: "+spl1[5]+"</p>");
                			out.print("<p> DATA: "+spl1[7]+"</p>");
                			out.print("<p> PARTENZA: "+spl1[2]+" "+spl1[4].split("-")[0]+"</p>");
                			out.print("<p> ARRIVO: "+spl1[3]+" "+spl1[4].split("-")[1]+"</p>");
                			out.print("<p> CAMBIO: 0</p>");
                			out.print("<p> CLASSE: "+spl1[6].split(":")[0]+"</p>");
                			out.print("<p> POSTI :</p>");
                			
                			int i=1;
                			for(String s:dt.Trackposti(Cod,"RITORNO")){
                				out.print("<p>Posto"+i+":  "+s+"</p>");
                				i++;
                			}
                						
                			
                		}
                		if(spl1.length>=10){
                			
                			out.print("<p> COMPAGNIA: "+spl1[8]+"</p>");
                			out.print("<p> DATA: "+spl1[10]+"</p>");
                			out.print("<p> PARTENZA: "+spl1[2]+" "+spl1[4].split("-")[0]+"</p>");
                			out.print("<p> ARRIVO: "+spl1[6]+" "+spl1[7].split("-")[1]+"</p>");
                			out.print("<p> CAMBIO: 1</p>");
                			out.print("<p> STAZIONE CAMBIO: "+spl1[3]+" "+spl1[4].split("-")[1]+"-"+spl1[7].split("-")[0]+"</p>");
                			out.print("<p> CLASSE: "+spl1[9].split(":")[0]+"</p>");
                			out.print("<p> POSTI:</p>");
                			
                			int i=1;
                			for(String s:dt.Trackposti(Cod,"RITORNO")){
                				out.print("<p>Posto"+i+":  "+s+"</p>");
                				i++;
                			}
                		}
        			
        			}
               
               %>
        </p>
        </center>
        </div>
        
        <div>
           		<center>
                        <form action="confermaCancellazione.jsp" >
                        <tr>
                        <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="cancella prenotazione"></td>
                        </tr>
                        </form>
                    </table>    
                </center>     
        </div>
        
        
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>
    </body>
</html>
