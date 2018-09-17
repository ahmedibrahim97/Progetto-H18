package controller;

import java.io.IOException;
import java.io.PrintWriter;
import model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="Controller2", urlPatterns={"/Controller2"})
public class PostiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Servizioferroviario servizio=(Servizioferroviario)request.getSession().getAttribute("servizio");
		try(PrintWriter out = response.getWriter()){
			
			String msg=request.getParameter("param");
		    Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
		    pr.setNumadulti((Integer)request.getSession().getAttribute("num"));
		    request.getSession().setAttribute("msg",msg);
		    Viaggio v=servizio.getV2();
		    servizio.getPosti().clear();
		    if(v!=null){
		        
		        response.sendRedirect("viewposto1.jsp");
		    }
		    else{
		    
		        response.sendRedirect("viewposti.jsp");
		    	
		    
		    }
			
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
