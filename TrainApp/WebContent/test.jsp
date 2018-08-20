<%@page import="Model.*"%>
<jsp:useBean id="servizio" class="Model.Servizioferroviario" scope="session"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	Tester t= new Tester();
	
	t.inits();

	out.print(t.getCompagnie().size());
%>