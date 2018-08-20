package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import model.*;


@WebServlet(name="Controller4", urlPatterns={"/Controller4"})
public class Controller4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Servizioferroviario servizio=(Servizioferroviario)request.getSession().getAttribute("servizio");
		
		try(PrintWriter out = response.getWriter()){
			 Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
			 DaoRegistrator dr=(DaoRegistrator)request.getSession().getAttribute("dbr");
			 
			 
			 if(servizio.getV2()==null){
				 dr.setCodViaggio(servizio.getV1().getCodviaggio());
				 dr.setStp(pr.getStazionepartenza());
				 dr.setSta(pr.getStazionearrivo());
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.setPt(s);
					 dr.run();
					 
				 }
			 }
			 else if(servizio.getV2()!=null){
				 dr.setCodViaggio(servizio.getV1().getCodviaggio());
				 dr.setStp(pr.getStazionepartenza());
				 dr.setSta(servizio.getStazioneincroccio());
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.setPt(s.split("/")[0]);
					 dr.run();
					 
				 }
				 dr.setCodViaggio(servizio.getV2().getCodviaggio());
				 dr.setStp(servizio.getStazioneincroccio());
				 dr.setSta(pr.getStazionearrivo());
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.setPt(s.split("/")[1]);
					 dr.run();
					 
				 }
				 
			 }
			 
			 
			    
			    if(pr.getDataritorno()!=null){
			        boolean b=(boolean)request.getSession().getAttribute("b");
			       if(b==false){
			           b=true;
			           request.getSession().setAttribute("b",b);
			           response.sendRedirect("viaggiRitorno.jsp");
			       }
			    }
			   
			    else{
			        response.sendRedirect("fine.jsp");
			    	
			    }
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
