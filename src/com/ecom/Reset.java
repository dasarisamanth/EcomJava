package com.ecom;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.Emailer;



public class Reset extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		try {
			Connection con = DB.getDataSource().getConnection();
			System.out.println(con);
			Random ran = new Random();
			int token = ran.nextInt(900)+100;
			System.out.println(token);
			Date now = new Date();
			Timestamp ts= new Timestamp(now.getTime());
			System.out.println(ts);
			PreparedStatement pst = con.prepareStatement("update users_ecom set otp=?,otpdate=? where email=?");
			pst.setInt(1, token);
			pst.setTimestamp(2, ts);
			pst.setString(3, email);
			
			 int r = pst.executeUpdate();
			 System.out.println(r);
			 con.commit();
			String message = "One Time Password To Reset Your Account Login is:"+token+ " and is valid only for 5 mins .Thanks& Regadrs Admin";
			 PreparedStatement pst2 = con.prepareStatement("select *  from users_ecom where email=?");
			 pst2.setString(1, email);
			 ResultSet rs = pst2.executeQuery();
			  rs.next();
			 int tokendb = rs.getInt("otp");
			 Timestamp tsdb = rs.getTimestamp("otpdate");
			 HttpSession ses = req.getSession(false);
			 ses.setAttribute("otp", tokendb);
			 ses.setAttribute("time", tsdb);
			 ses.setAttribute("email", email);
			 con.close();
			 pst.close();
			 pst2.close();
			 try {
				Emailer.email(email, message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("no email sent");
			}
			     res.sendRedirect("./otp.html");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher rd = req.getRequestDispatcher("./login.jsp");
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.print("<div class='alert alert-danger'>User Doesn't Exist</div>");
			rd.include(req, res);
		}
	}
		
}
