package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.OPZIONE;
import model.Servizioferroviario;

@WebServlet(name="Controller5", urlPatterns={"/Controller5"})
public class Controller5 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		Servizioferroviario servizio =(Servizioferroviario)session.getAttribute("servizio");
		try{
			PrintWriter out = response.getWriter();
			DaoFactory dao=(DaoFactory) request.getSession().getAttribute("dao");
			DaoServiceInitializer di=dao.getServiceInitializer();
			di.inits(servizio);
			request.getSession().setAttribute("servizio",servizio);
			String mod=(String)session.getAttribute("mod");
			
			if(mod.equals(OPZIONE.ANDATA.name())){
				response.sendRedirect("viewviaggi.jsp");
			}
			else if(mod.equals(OPZIONE.ANDATA_RITORNO.name())){
				response.sendRedirect("viewviaggiAndata.jsp");
			}
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
