<%-- 
    Document   : viewposti2
    Created on : 5 juil. 2018, 20:17:45
    Author     : QUENTIN
--%>

<%@page import="Controller.Viaggio"%>
<%@page import="Controller.Tipologia"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String pos=request.getParameter("param");
    int num=Integer.parseInt(pos.split("/")[0]);
    Viaggio v=servizio.getV2();
    

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posto2</title>
    </head>
    <body>
       <%       
           
           if(v!=null){
                out.print("<div>");
                out.print("<table style=\"border:1; align:center; margin-bottom:2px;\">");
                int i,j,k;
                if(Tipologia.values()[num-1]==Tipologia.PRIMA_STANDARD || Tipologia.values()[num-1]==Tipologia.SECONDA_STANDARD){
                   
                    for(i=0;i<servizio.visualizzaposti(num,v).size();i++){
                            k=0;
                            out.print("<table border=\"1\" align=\"center\">");
                            out.print("<tr><h1 align=\"center\" >");
                            out.print("vagone"+(i+1));
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td>");
                                    
                                }
                                if(k==1){
                                    out.print("<td>");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                                }
                                if(k==2){
                                    out.print("<td>");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td>");
                                }    
                               
                                if(k==3){
                                    out.print("<td>");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td></tr>");
                                    k=-1;
                                }
                                k++;
                       
                            }
                        out.print("</table>");
                    }
                    
               }
                
                else{
                    
                    for(i=0;i<servizio.visualizzaposti(num,v).size();i++){
                            k=0;
                            out.print("<table border=\"1\" align=\"center\">");
                            out.print("<tr><h1 align=\"center\" >");
                            out.print("vagone"+(i+1));
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                               }
                                if(k==1){
                                    out.print("<td>");
                                    String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+pos+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    out.print("</td>");
                                    k=-1;
                              }
                                k++;
                
                            }
                        out.print("</table>");
                    }
                    }
                    out.print("</table>");
                    out.print("</div>");
                }
                else{
                
                    out.print("<div>");
                    out.print("<center>");
                    out.print("<h1>Riepilogo</h1>");
                    out.print("<table>");
                    out.print("<tr><p>");
                    out.print(pos.split("/")[2]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print("POSTO: ");
                    out.print(pos.split("/")[1]);
                    out.print("</p></tr>");
                    out.print("<tr><p>");
                    out.print(pos.split("/")[3]);
                    out.print("</p></tr>");
                    out.print("</table>");
                    out.print("</center>");
                    out.print("</div>");
                    out.print("<div>");
                    out.print("<form action=\"viewcarello.jsp\">");
                    out.print("<center>");
                    out.print("<table>");
                    out.print("<tr>");
                    out.print("<td colspan=\"5\" style=\"text-align: center\"><input class=\"btn btn-success\" type=\"submit\" value=\"inserisci nel carello\"></td>");
                    out.print("</tr>");
                    out.print("</table>");    
                    out.print("</center>"); 
                    out.print("</form>");    
                    out.print("</div>");
                
                }   
         
            %>
     
    </body>
</html>
