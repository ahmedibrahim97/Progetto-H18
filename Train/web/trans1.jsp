
<%@page import="Controller.*"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="servizio" class="Controller.Servizioferrovario" scope="session" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

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
           
        }
        else{
        
            Prenotazione pr=new Prenotazione(stp,sta,dp);
            pr.setNumadulti(num);
            session.setAttribute("pr",pr);
            response.sendRedirect("viewviaggi.jsp");
        
        
        }
    



%>
