
<%@page import="Controller.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        Tester t=new Tester();
        t.inits();
        servizio.setCompagnie(t.getCompagnie());
        servizio.setItinerari(t.getI());
        String stp=request.getParameter("partenza");
        String sta=request.getParameter("arrivo");
        String[] datap=request.getParameter("dataAndata").split("/");
        Date dp=new Date(Integer.parseInt(datap[2])-1900,Integer.parseInt(datap[1]),Integer.parseInt(datap[0]));
        String mod=request.getParameter("modalita");
        int num=Integer.parseInt(request.getParameter("numeroadulti"));
        session.setAttribute("num", num);
        
        if(mod.equals(OPZIONE.ANDATA_RITORNO.name())){
            
           String[] datar=request.getParameter("dataRitorno").split("/");
           Date dr=new Date(Integer.parseInt(datar[2])-1900,Integer.parseInt(datar[1]),Integer.parseInt(datar[0]));
           Prenotazione pr=new Prenotazione(stp,sta,dp,dr);
           pr.setNumadulti(num);
           session.setAttribute("pr",pr);
           if(dp.equals(dr) || dp.after(dr)){
               out.print("<center><h1>");
               out.print(" il giorno di partenza deve essere successivo al giorno di ritorno");
               out.print("</h1></center>");
           }
           else{
           
               response.sendRedirect("trans5.jsp");
           }
           
        }
        else{
        
            Prenotazione pr=new Prenotazione(stp,sta,dp);
            pr.setNumadulti(num);
            session.setAttribute("pr",pr);
            response.sendRedirect("viewviaggi.jsp");
        
        
        }
    }
    catch(Exception e){
    
        response.sendRedirect("index.jsp");
    }

%>
