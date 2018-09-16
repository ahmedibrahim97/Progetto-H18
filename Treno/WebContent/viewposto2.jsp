
<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    String msg=request.getParameter("param");
    String[] pos=msg.split("/");
    System.out.println(pos);
    int num=Integer.parseInt(pos[0]);
    Viaggio v=servizio.getV2();
    boolean b;
    

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
               
                background-color:bisque;
                
                
            }
            
        </style>
        <title>Posto2</title>
    </head>
    <body>
        <%
                out.print("<center><h3><p>");
                out.print(pos[7]+">>>>"+pos[8]+" "+pos[9]);
                out.print("</p><p>"+pos[10]+"</p><p>");
                out.print(pos[11].split(":")[0]);
                out.print("</p></h3></center>");
             
                out.print("<div>");
                out.print("<table style=\"border:1; align:center; margin-bottom:2px;\">");
                int i,j,k;
                if(Tipologia.values()[num-1]==Tipologia.PRIMA_STANDARD || Tipologia.values()[num-1]==Tipologia.SECONDA_STANDARD){
                   
                    for(i=0;i<servizio.visualizzaposti(num,v).size();i++){
                            k=0;
                            out.print("<table border=\"1\" align=\"center\">");
                            out.print("<tr><h1 align=\"center\" >");
                            out.print("vagone"+servizio.visualizzaposti(num,v).get(i).getNumvagone());
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                b=servizio.getV2().getRegistro().checkposto(s,servizio.getStazioneincroccio(),pr.getStazionearrivo(),servizio.getV2().getPercorso(),servizio.getV2().getModalita());
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
                                    out.print("</td>");
                                    
                                }
                                if(k==1){
                                    out.print("<td>");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                                }
                                if(k==2){
                                    out.print("<td>");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
                                    out.print("</td>");
                                }    
                               
                                if(k==3){
                                    out.print("<td>");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
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
                            out.print("vagone"+servizio.visualizzaposti(num,v).get(i).getNumvagone());
                            out.print("</h1></tr>");  
                            
                            for(j=0;j<servizio.visualizzaposti(num,v).get(i).getPosti().size();j++){
                                String s=servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString();
                                b=servizio.getV2().getRegistro().checkposto(s,servizio.getStazioneincroccio(),pr.getStazionearrivo(),servizio.getV2().getPercorso(),servizio.getV2().getModalita());
                                if(k==0){
                                    out.print("<tr><td id=\""+servizio.visualizzaposti(num,v).get(i).getPosti().get(j).toString()+"\""+">");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
                                    out.print("</td>");
                                    out.print("<td>&nbsp&nbsp</td>");
                               }
                                if(k==1){
                                    out.print("<td>");
                                    if(b){
                                    out.print("<a href=\"viewriepilogo.jsp?param="+s+"/"+msg+"\">");
                                    out.print(s);
                                    out.print("<a/>");
                                    }
                                    else{
                                    out.print(s);
                                    }
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
                
                
         
            %>
     
    </body>
</html>
