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

public class DeleteCart extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String p_id = req.getParameter("deletecart");
		String userName=null;
		Cookie[] cookies = req.getCookies();
		if(cookies !=null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user")){
				userName = cookie.getValue();
				}
			}
		}
		else {
			RequestDispatcher rd=	req.getRequestDispatcher("./login.jsp");
			rd.forward(req, res);
		}
		try {
			Connection con = DB.getDataSource().getConnection();
			PreparedStatement pst = con.prepareStatement("delete from ecom_cart where EMAIL=? and PRODUCT_ID=?");
		     pst.setString(1, userName);
		     pst.setString(2, p_id);
		     int r = pst.executeUpdate();
		     if(r==1) {
		    	 con.commit();
					con.close();
					pst.close();
					RequestDispatcher rd=	req.getRequestDispatcher("./viewcart.jsp");
					out.print("<div class='alert alert-info'>Deleted Successfully</div>");
					rd.include(req, res);
		     }
		     else {
		    	 RequestDispatcher rd=	req.getRequestDispatcher("./viewcart.jsp");
		    	 out.print("<div class='alert alert-warning'>Something Went Wrong Please Try Again</div>");
					rd.include(req, res);
		     }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("im in delete cart exeception");
			e.printStackTrace();
			 RequestDispatcher rd=	req.getRequestDispatcher("./viewcart.jsp");
	    	 out.print("<div class='alert alert-warning'>Something Went Wrong Please Try Again</div>");
				rd.include(req, res);
				
		}
		
	}
	
}
