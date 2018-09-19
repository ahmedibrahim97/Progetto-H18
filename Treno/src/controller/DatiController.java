package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;


@WebServlet(name="Controller1", urlPatterns={"/Controller1"})
public class DatiController extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//Servizioferroviario servizio =(Servizioferroviario)session.getAttribute("servizio");
		DateFormat str=new SimpleDateFormat("yyyy-MM-dd");
		
		response.setContentType("text/html;charset=UTF-8");
		try{
			PrintWriter out = response.getWriter();
			DaoFactory dao=DaoFactory.getInstance();
			request.getSession().setAttribute("dao",dao);
			DaoServiceInitializer di=dao.getServiceInitializer();
			Servizioferroviario s=new Servizioferroviario();
			di.inits(s);
			/*s.getCompagnie().addAll(0,di.getCompagnie());
			s.getItinerari().addAll(0,di.getI());*/
			request.getSession().setAttribute("servizio",s);
			request.getSession().setAttribute("dao",dao);
			
			DaoRegistrator dbr=dao.getDaoRegistrator();
			DaoTracker dt=dao.getDaoTracker();
			request.getSession().setAttribute("dbr",dbr);
			

			String stp=request.getParameter("partenza").toUpperCase();
		    String sta=request.getParameter("arrivo").toUpperCase();
		    String datap=request.getParameter("dataAndata");
		    Date dp=str.parse(datap);
		    String mod=request.getParameter("modalita");
		    int num=0;
		    num=Integer.parseInt(request.getParameter("numeroadulti"));
		    request.getSession().setAttribute("num",num);
		    request.getSession().setAttribute("mod",mod);

		 
		    Random random=new Random();
		    int k=100000;
		    int r=random.nextInt(k);
		    String preno=stp.substring(0,2)+sta.substring(0,2)+r;
		    while(dt.checkcod(preno)!=0){
		    	k=10;
		    	r=random.nextInt(k);
		        preno=stp.substring(0,2)+sta.substring(0,2)+r;
		    			
		    }
		    request.getSession().setAttribute("preno",preno);
		    boolean b=false;
		    request.getSession().setAttribute("b",b);
		 
		    
		    if(mod.equals(OPZIONE.ANDATA_RITORNO.name())){
	            
		           String datar=request.getParameter("dataRitorno");
		           Date dr=str.parse(datar);
		           Prenotazione pr=new Prenotazione(stp,sta,dp,dr);
		           pr.setNumadulti(num);
		           request.getSession().setAttribute("pr",pr);
		           if(dp.equals(dr) || dp.after(dr)){
		               out.print("<center><p><h1>");
		               out.print(" il giorno di partenza deve essere successivo al giorno di ritorno");
		               out.print("</h1></p>");
		               out.print("<p><a href=\"index.jsp\">torna alla homepage<a/></p>");
		               out.print("</center>");
		           }
		           else{
		           
		        	   response.sendRedirect("viewviaggiAndata.jsp");

		           }
		           
		        }
		        else{
		        
		            Prenotazione pr=new Prenotazione(stp,sta,dp);
		            pr.setNumadulti(num);
		            request.getSession().setAttribute("pr",pr);
		            response.sendRedirect("viewviaggi.jsp");
		            
		        
		        
		        }
		   
		  
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("errorindex.jsp");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
