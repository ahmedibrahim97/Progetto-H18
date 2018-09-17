package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.DaoTracker;

/**
 * Servlet implementation class Controller6
 */
@WebServlet("/Controller6")
public class TrackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	try{
			PrintWriter out =response.getWriter();
			String Cod=request.getParameter("code");
			DaoFactory dao=DaoFactory.getInstance();
			DaoTracker dt=dao.getDaoTracker();
			int k=dt.checkcod(Cod);
			if(k>0){
				request.getSession().setAttribute("dao",dao);
				request.getSession().setAttribute("k",k);
				request.getSession().setAttribute("Cod",Cod);
				response.sendRedirect("ricevuta.jsp");
			}
			else{
				response.sendRedirect("errorTracking.jsp");
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
