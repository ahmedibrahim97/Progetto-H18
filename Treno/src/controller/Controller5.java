package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;


@WebServlet(name="Controller5", urlPatterns={"/Controller5"})
public class Controller5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Servizioferroviario servizio=(Servizioferroviario)request.getSession().getAttribute("servizio");
		
		try(PrintWriter out = response.getWriter()){
			 	Prenotazione pr=(Prenotazione)request.getSession().getAttribute("pr");
			    Prenotazione pr1=new Prenotazione(pr.getStazionepartenza(),pr.getStazionearrivo(),pr.getDatapartenza());
			    Prenotazione pr2=new Prenotazione(pr.getStazionearrivo(),pr.getStazionepartenza(),pr.getDataritorno());
			    boolean b=false;
			    request.getSession().setAttribute("b",b);
			    int i=0,j=0;
			   
			    for(String s:servizio.checktreno(pr2)){
			        if(s!=null){
			            i++;
			        }
			    }
			    for(String s:servizio.checktreno(pr1)){
			        if(s!=null){
			            j++;
			        }
			    }
			    if(i==0||j==0){
			        out.print("<center><h1>nessuna soluzione di viaggio trovata!!!</h1><center>");
			        out.print("<p><a href=\"index.jsp\">torna alla homepage<a/></p>");
			    }
			    else{
			        response.sendRedirect("viewviaggiAndata.jsp");
			    
			    }
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
