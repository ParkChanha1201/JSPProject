<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String rest_name = request.getParameter("rest_name");
	String address = request.getParameter("address");
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	
	double posX = Double.parseDouble(x);
	double posY = Double.parseDouble(y);

	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();

		String sql = "insert into restaurant values (null, ?, ?, ?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, rest_name);
		stmt.setDouble(2, posX);
		stmt.setDouble(3, posY);
		stmt.executeUpdate();
	
		
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

%>