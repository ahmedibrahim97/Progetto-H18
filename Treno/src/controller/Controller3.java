package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;



@WebServlet(name="Controller3", urlPatterns={"/Controller3"})
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Servizioferroviario servizio=(Servizioferroviario)request.getSession().getAttribute("servizio");
		
		try(PrintWriter out = response.getWriter()){
			
			Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
		    String posto=(String)request.getSession().getAttribute("posto");
		    servizio.getPosti().add(posto);
		    if(servizio.getV2()==null){
		        
		        int i=servizio.returncompagnia(servizio.getV1().getCodviaggio().split("-")[0]);
		        int j=servizio.getCompagnie().get(i).returnviaggio(servizio.getV1().getCodviaggio());
		        servizio.getCompagnie().get(i).getViaggi().get(j).getRegistro().aggiungiriservazione(posto,pr.getStazionepartenza(),pr.getStazionearrivo());
		        //out.print(servizio.getV1().getRegistro().checkposto("3A", pr.getStazionepartenza(),pr.getStazionearrivo(),servizio.getV1().getPercorso(),servizio.getV1().getModalita()));
		       
		    }
		    if(servizio.getV2()!=null){
		        int i=servizio.returncompagnia(servizio.getV1().getCodviaggio().split("-")[0]);
		        int j=servizio.getCompagnie().get(i).returnviaggio(servizio.getV1().getCodviaggio());
		        servizio.getCompagnie().get(i).getViaggi().get(j).getRegistro().aggiungiriservazione(posto.split("/")[0],pr.getStazionepartenza(),servizio.getStazioneincroccio());
		        int k=servizio.returncompagnia(servizio.getV2().getCodviaggio().split("-")[0]);
		        int l=servizio.getCompagnie().get(i).returnviaggio(servizio.getV2().getCodviaggio());
		        servizio.getCompagnie().get(k).getViaggi().get(l).getRegistro().aggiungiriservazione(posto.split("/")[1],servizio.getStazioneincroccio(),pr.getStazionearrivo());
		    }
		    
		    
		    pr.setNumadulti(pr.getNumadulti()-1);

		    
		    if(pr.getNumadulti()==0){
		    
		        response.sendRedirect("carello.jsp");
		    }

		    if(pr.getNumadulti()>0){

		       
		       request.getSession().setAttribute("pr", pr);
		       
		       if(servizio.getV2()==null){
		           response.sendRedirect("viewposti.jsp");
		       }
		       else{
		           response.sendRedirect("viewposto1.jsp");
		       }
		    
		    }


		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
