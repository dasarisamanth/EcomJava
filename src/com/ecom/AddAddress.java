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

public class AddAddress  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String AddressLine_1 = req.getParameter("aline1");
		String AddressLine_2 = req.getParameter("aline2");
		String City = req.getParameter("city");
		String State = req.getParameter("state");
		String Country = req.getParameter("country");
		String ZipCode = req.getParameter("zip");
		String NickName = req.getParameter("nickname");
		String userName=null;
		try {
			Cookie[] cookies = req.getCookies();
			if(cookies !=null){
				for(Cookie cookie : cookies){
					
					if(cookie.getName().equals("user"))
						 userName = cookie.getValue();
					
				}
				
				}
			Connection con = DB.getDataSource().getConnection();
			PreparedStatement pst = con.prepareStatement("insert into users_ecom_address values(?,?,?,?,?,?,?,?)");
			pst.setString(1, userName);
			System.out.println(userName);
			pst.setString(2, AddressLine_1);
			pst.setString(3, AddressLine_2);
			pst.setString(4, City);
			pst.setString(5, State);
			pst.setString(6, Country);
			pst.setString(7, ZipCode);
			pst.setString(8, NickName);
			int r = pst.executeUpdate();
			con.commit();
			if(r==1) {
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd = req.getRequestDispatcher("./addresslist.jsp");
			PrintWriter out = res.getWriter();
			out.print("<div  class='alert alert-danger'>Something Went Wrong Please Try Again</div>");
			rd.include(req, res);
		}
				
	}
}
