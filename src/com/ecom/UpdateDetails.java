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

public class UpdateDetails extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String val = req.getParameter("update");
		String param = req.getParameter(val);
		System.out.println(val);
		System.out.println(param);
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
			System.out.println(userName);
			if(val.equals("email")) {
				
			     PreparedStatement pst = con.prepareStatement("update users_ecom set " +val+ "=? where email=?");
					System.out.println("update users_ecom set" +val+ "=? where email=?");
					pst.setString(1, param);
					pst.setString(2, userName);
			     int r1 = pst.executeUpdate();
			     PreparedStatement pst2 = con.prepareStatement("update users_ecom_address set " +val+ "=? where email=?");
			     pst2.setString(1, param);
			     pst2.setString(2, userName);
			     int r2 = pst2.executeUpdate();
			     System.out.println(r1);
			     System.out.println(r2);
			     if(r1>=1 && r2>=1) {
			    	 con.commit();
			    	 con.close();
			    	 HttpSession session = req.getSession(false);
			 		String user  = (String) session.getAttribute("user");
			 		Cookie refresh = new Cookie("user",user);
			 		refresh.setMaxAge(0);
			 		res.addCookie(refresh);
			 		session.invalidate();
			 		
			 		
			    	 RequestDispatcher rd=	req.getRequestDispatcher("./login.jsp");
			    	 out.print("<div class='alert alert-info'>Email Updated Please Login</div>");
						rd.include(req, res); 
			     }
			     else {
			    	 RequestDispatcher rd=	req.getRequestDispatcher("./userprofile.jsp");
			    	 out.print("<div class='alert alert-warning'>Something Went Wrong Please Try Again</div>");
						rd.include(req, res); 
			     }
			}
			else {
				PreparedStatement pst = con.prepareStatement("update users_ecom set "+val+ "=? where email=?");
				System.out.println("update users_ecom set" +val+ "=? where email=?");
				pst.setString(1, param);
				pst.setString(2, userName);
		        
				int r = pst.executeUpdate();
				if(r==1) {
					con.commit();
					con.close();
					RequestDispatcher rd=	req.getRequestDispatcher("./userprofile.jsp");
			    	 out.print("<div class='alert alert-info'>Updated Successfully</div>");
						rd.include(req, res); 
				}
				else {
					RequestDispatcher rd=	req.getRequestDispatcher("./userprofile.jsp");
			    	 out.print("<div class='alert alert-warning'>Something Went Wrong Please Try Again</div>");
						rd.include(req, res);
				}
			}
		} catch (SQLException e) {
			System.out.println("in update details excep");
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd=	req.getRequestDispatcher("./userprofile.jsp");
	    	 out.print("<div class='alert alert-warning'>Something Went Wrong Please Try Again</div>");
				rd.include(req, res); 
		}
	}

}
