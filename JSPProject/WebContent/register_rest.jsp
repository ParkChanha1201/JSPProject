<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String rest_name = request.getParameter("rest_name");
	String address = request.getParameter("address");
	String x = request.getParameter("x");
	String y = request.getParameter("y");

	out.print(x);
	out.print(y);
	
	//double posX = Double.parseDouble(x);
	//double posY = Double.parseDouble(y);

	//out.print(posX);
	//out.print(posY);

%>