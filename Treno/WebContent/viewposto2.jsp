<%@page import="dao.*"%>
<%@page import="model.*"%>
<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Prenotazione pr=(Prenotazione)session.getAttribute("pr");
    String msg=request.getParameter("param");
    String[] pos=msg.split("/");
    int num=Integer.parseInt(pos[0]);
    DaoFactory dao=(DaoFactory)request.getSession().getAttribute("dao");
    DaoServiceInitializer di=dao.getServiceInitializer();   
    Viaggio v=servizio.getV2();
    di.checktrack(v);
    boolean b;
    

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
   		 <link rel="stylesheet" href="viaggiStyle.css">
        <title>Posto2</title>
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
    
        <%
                out.print("<center><h3><p>");
                out.print(pos[7]+">>>>"+pos[8]+" "+pos[9]);
                out.print("</p><p>"+pos[10]+"</p><p>");
                out.print(pos[11].split(":")[0]);
                out.print("</p></h3></center>");
             
                out.print("<div>");
              
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
     
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="js/bootstrap.min.js"></script>
     
     
    </body>
</html>
