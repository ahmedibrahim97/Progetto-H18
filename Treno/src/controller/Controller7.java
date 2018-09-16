package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

/**
 * Servlet implementation class Controller7
 */
@WebServlet("/Controller7")
public class Controller7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try{
			String Cod=(String)request.getSession().getAttribute("Cod");
			DaoFactory dao=DaoFactory.getInstance();
			DaoCanceller dc=dao.getDaoCanceller();
			dc.deleteprenotazione(Cod);
			response.sendRedirect("finecancellazione.jsp");
			
			
		}
		catch(Exception ex){
			ex.printStackTrace();
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
