package com.ecom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ResetSuccess extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		HttpSession ses = req.getSession(false);
		String email = (String) ses.getAttribute("email");
		PrintWriter out = res.getWriter();
		String pass = req.getParameter("pswd");
		String rpass = req.getParameter("rpswd");
		if(pass.equals(rpass)) {
			try {
				Connection con = DB.getDataSource().getConnection();
				PreparedStatement pst = con.prepareStatement("update users_ecom set password=? where email=?");
				pst.setInt(1, rpass.hashCode());
				pst.setString(2, email);
				pst.executeUpdate();
				con.commit();
				con.close();
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher rd = req.getRequestDispatcher("./index.jsp");
			res.setContentType("text/html");
			ses.removeAttribute("auth");
			out.print("<div class='alert alert-info'>Reset Successful Please Login</div>");
			rd.include(req, res);
			
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("./password.jsp");
			res.setContentType("text/html");
			
			out.print("<div class='alert alert-danger'>Passwords Dont Match</div>");
			rd.include(req, res);
		}
	}
	

}
