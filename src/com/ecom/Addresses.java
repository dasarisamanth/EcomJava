package com.ecom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;





public class Addresses {

	

	public static ArrayList<Address> getAddress(String email) throws SQLException{
		Connection con = DB.getDataSource().getConnection();
		PreparedStatement pst = con.prepareStatement("select * from users_ecom_address where email=?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		ArrayList<Address> al = new ArrayList<Address>();
		while(rs.next()) {
		
			Address ad= new Address();
			ad.setAddressLine_1(rs.getString("addressline_1"));
			ad.setAddressLine_2(rs.getString("addressline_2"));
			ad.setCity(rs.getString("city"));
			ad.setState(rs.getString("state"));
			ad.setCountry(rs.getString("country"));
			ad.setZipCode(rs.getString("zipcode"));
			ad.setNickName(rs.getString("nickname"));
			al.add(ad);
		}
		return al;
		
	}
	
}
