<jsp:useBean id="servizio" class="model.Servizioferroviario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String pos=request.getParameter("param");
    String posto=null;
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
        <title>Riepilogo</title>
    </head>
    <body>
        <div>
        <center>
        <h1>Riepilogo</h1>
        
        <table><%
            
                    if(servizio.getV2()!=null){
                        posto=pos.split("/")[2]+"/"+pos.split("/")[0];
                        session.setAttribute("posto",posto);
                        out.print("<tr><p>");
                        out.print(pos.split("/")[11]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print(pos.split("/")[12].split(":")[0]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print(pos.split("/")[5]+">>>>"+pos.split("/")[6]+" "+pos.split("/")[7]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print("POSTO: ");
                        out.print(pos.split("/")[2]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print(pos.split("/")[8]+">>>>"+pos.split("/")[9]+" "+pos.split("/")[10]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print("POSTO: ");
                        out.print(pos.split("/")[0]);
                        out.print("</p></tr>");
                        
                    }
                    else{
                        posto=pos.split("/")[1];
                        session.setAttribute("posto",posto);
                        out.print("<tr><p>");
                        out.print(pos.split("/")[7]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print(pos.split("/")[8].split(":")[0]);
                        out.print("</p></tr>");
                        out.print("<tr><p>");
                        out.print("POSTO: ");
                        out.print(pos.split("/")[1]);
                        out.print("</p></tr>");
                        
                 
                    
                    }
               %>
        </table>
        </center>
        </div>
        <div>
            <form action="Controller3" method="POST" >
                <center>
                    <table>
                        <tr>
                        <td colspan="5" style="text-align: center"><input class="btn btn-success" type="submit" value="prenota"></td>
                        </tr>
                    </table>    
                </center> 
           </form>    
        </div>
    </body>
</html>
