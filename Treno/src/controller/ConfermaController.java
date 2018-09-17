package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import model.*;


@WebServlet(name="Controller4", urlPatterns={"/Controller4"})
public class ConfermaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Servizioferroviario servizio=(Servizioferroviario)request.getSession().getAttribute("servizio");
		DateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		
		try(PrintWriter out = response.getWriter()){
			 Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
			 DaoRegistrator dr=(DaoRegistrator)request.getSession().getAttribute("dbr");
			 String preno=request.getSession().getAttribute("preno").toString();
			 String msg=request.getSession().getAttribute("msg").toString();
			 boolean b=(boolean)request.getSession().getAttribute("b");
			 String mod="ANDATA";
			 
			 if(b==false){
				 dr.uploadprenotazioni(preno,msg+"/"+sdf.format(pr.getDatapartenza()),mod);
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.uploadprenotazioni_posto(preno,s,mod);
				
				 }
			
			 }
			 if(b==true){
				 mod="RITORNO";
				 dr.uploadprenotazioni(preno,msg+"/"+sdf.format(pr.getDatapartenza()),mod);
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.uploadprenotazioni_posto(preno,s,mod);
				
				 }
				 
			 }
			 
			 if(servizio.getV2()==null){
				
				 
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.uploadregistro(servizio.getV1().getCodviaggio(),pr.getStazionepartenza(),pr.getStazionearrivo(),s, preno);
				
				 }
			 }
			 else if(servizio.getV2()!=null){
				 
				 for(String s: servizio.getPosti()){				 	 
					 
		
					 dr.uploadregistro(servizio.getV1().getCodviaggio(),pr.getStazionepartenza(),pr.getStazionearrivo(),s.split("/")[0], preno);
					 
				 }
				
				 for(String s: servizio.getPosti()){				 	 
					 
					 dr.uploadregistro(servizio.getV1().getCodviaggio(),pr.getStazionepartenza(),pr.getStazionearrivo(),s.split("/")[1], preno);
					 
					 
				 }
				 
			 }
			 
	
			    
			 if(pr.getDataritorno()!=null){
				  
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
