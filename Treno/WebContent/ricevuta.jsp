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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 10px;
            }
           
            body{
               
                background-color:cyan;
                
                
            }
            
        </style>
        <title>tracking</title>
    </head>
    <body>
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
            <form action="index.jsp"  >
                <center>
                    <table>
                    	 <form action="index.jsp"  >
                        <tr>
                        <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="home"></td>
                        </tr>
                        </form>
                        <form action="confermaCancellazione.jsp" >
                        <tr>
                        <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="cancella prenotazione"></td>
                        </tr>
                        </form>
                    </table>    
                </center>     
        </div>
    </body>
</html>
