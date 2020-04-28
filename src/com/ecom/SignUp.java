package com.ecom;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignUp extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
        String email = req.getParameter("email");
	     int hspd = req.getParameter("pswd").hashCode();
	  String dob = req.getParameter("dob");
	     
	     try {
			Connection con = DB.getDataSource().getConnection();
			PreparedStatement pst = con.prepareStatement("insert into users_ecom values(?,?,?,?,?,?,?,?)");
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, email);
			pst.setInt(4, hspd);
			pst.setString(5, null);
			pst.setTimestamp(6, null);
			pst.setTimestamp(7, null);
			pst.setString(8, dob);
			
			
		
			int executeUpdate = pst.executeUpdate();
			
			
			if(executeUpdate!=0) {
				con.commit();
				HttpSession session = req.getSession();
				session.setAttribute("user", email);
				session.setMaxInactiveInterval(30*60);
				Cookie refresh = new Cookie("user",email);
				refresh.setMaxAge(60*60);
				res.addCookie(refresh);
				res.sendRedirect("./SignUpRedirect.jsp");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out= res.getWriter();
			out.println("<div class='alert alert-warning'>User Already Exists Please Log In </div>");
			rd.include(req, res);
		};
	
	}

}
