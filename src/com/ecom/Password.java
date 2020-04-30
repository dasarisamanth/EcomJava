package com.ecom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Password extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("html/text");
		PrintWriter out = res.getWriter();
		Date now = new Date();
		String otp = req.getParameter("otp");
		int otps= Integer.parseInt(otp);
		System.out.println(otps);
		HttpSession ses = req.getSession(false);
		int tokendb= (int) ses.getAttribute("otp");
		
		
		System.out.println(tokendb);
	Timestamp ts=	(Timestamp) ses.getAttribute("time");
	ts.setSeconds(5*60);
	if(otps==tokendb) {
		Timestamp ts1 = new Timestamp(now.getTime());
		if(ts1.before(ts)) {
			
			ses.setAttribute("auth","true");
			res.sendRedirect("./password.jsp");
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("./reset.html");
			res.setContentType("text/html");
			
			out.print("<div class='alert alert-danger'>OTP Expired</div>");
			rd.include(req, res);
		}
		
		
	}
	else {
		RequestDispatcher rd = req.getRequestDispatcher("./reset.html");
		res.setContentType("text/html");
		
		out.print("<div class='alert alert-danger'>Invalid OTP</div>");
		rd.include(req, res);
		
	}
	}
}
