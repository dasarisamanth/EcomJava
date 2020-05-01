package com.ecom;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserProfile  {
	
	public static String[]  getUser(String userName) throws SQLException {
		String[] ar = new String[4];
		
			Connection con = DB.getDataSource().getConnection();
			PreparedStatement pst = con.prepareStatement("select * from users_ecom where email=?");
			pst.setString(1, userName);
			ResultSet rs = pst.executeQuery();
			rs.next();
			String fname = rs.getString("firstname");
			String lname = rs.getString("lastname");
			String dob = rs.getString("dob");
			ar[0]=fname;
			ar[1]=lname;
			ar[2]=dob;
			ar[3]=userName;
			con.close();
			pst.close();
		
		return ar;
		
	}
	
}