package com.ecom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {
static int count=3;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		try {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String email = req.getParameter("email");
		 int hshpd = req.getParameter("pswd").hashCode();
		 
		HttpSession ses = req.getSession();
			
		
		try {
			
			Connection con = DB.getDataSource().getConnection();
			PreparedStatement pst = con.prepareStatement("select password from users_ecom where email=?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			rs.next();
			int hsdbpd = Integer.parseInt(rs.getString("password"));
			if(hshpd==hsdbpd) {
				ses.setAttribute("user", email);
				ses.setMaxInactiveInterval(30*60);
				con.close();
				pst.close();
				chain.doFilter(req, res);
				
				
			}
			else {
				
				if(count>=1 && count<=3) {
				RequestDispatcher rd = req.getRequestDispatcher("./login.jsp");
				res.setContentType("text/html");
				PrintWriter out = res.getWriter();
				count--;
				if(count<=0) {
					PreparedStatement pst2 = con.prepareStatement("update users_ecom set password=? where email=?");
					int hshpdb = "random1234".hashCode();
					pst2.setInt(1, hshpdb);
					pst2.setString(2, email);
					pst2.executeUpdate();
					
					res.setContentType("text/html");
					 out = res.getWriter();
					count=3;
					out.print("<div class='alert alert-danger'>Account Locked Please Reset Password</div>");
					rd.include(req, res);
					
					
					
				}
				
				
				out.print("<div class='alert alert-danger'>Invalid Email/Password</div>");
				out.print("<div class='alert alert-danger'>"+"No Of Attempts Left:"+count+"</div>");
			    rd.include(req, res);
				}
				 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher rd = req.getRequestDispatcher("./login.jsp");
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.print("<div class='alert alert-danger'>User Doesn't Exist</div>");
			rd.include(req, res);
			
		}
	}
	catch(NullPointerException ne) {
		
		HttpServletResponse res = (HttpServletResponse) response;  
		res.sendRedirect("./login.jsp");
	}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	

}