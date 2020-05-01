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

public class DeleteAddress extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			Connection con = DB.getDataSource().getConnection();
			String value=null;
			String select[] = req.getParameterValues("names"); 
			if (select != null && select.length != 0) {

			for (int i = 0; i <=select.length-1; i++) {
			        value=select[i]; 
			        System.out.println(value);
			        PreparedStatement pst = con.prepareStatement("delete from users_ecom_address where nickname=?");
			        pst.setString(1, value);
			        int r = pst.executeUpdate();
			        con.commit();
			        if(r>=1) {
			        	con.close();
			        	pst.close();
			        	res.sendRedirect("./addresslist.jsp");
			        }
			        else {
						RequestDispatcher rd = req.getRequestDispatcher("./addresslist.jsp");
						PrintWriter out = res.getWriter();
						out.print("<div class='alert alert-danger'>Something Went Wrong Please Try Again</div>");
						rd.include(req, res);
					}
			        
			}
			} 
			else {
				RequestDispatcher rd = req.getRequestDispatcher("./addresslist.jsp");
				PrintWriter out = res.getWriter();
				out.print("<div class='alert alert-danger'>Please Select An Address You Want To Delete</div>");
				rd.include(req, res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
