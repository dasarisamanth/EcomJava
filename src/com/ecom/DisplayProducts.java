package com.ecom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DisplayProducts {
	
	public static ArrayList<Product> getProducts() throws SQLException{
		ArrayList<Product> al = new ArrayList<Product>(); 
		Connection con = DB.getDataSource().getConnection();
		PreparedStatement pst = con.prepareStatement("select * from ecom_flowers");
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			Product prod = new Product();
			prod.setP_id(rs.getString(1));
			prod.setP_name(rs.getString(2));
			prod.setP_img(rs.getString(3));
			prod.setP_qty(rs.getInt(4));
			prod.setP_price(rs.getInt(5));
			al.add(prod);
		}
		con.close();
		
		return al;
		
	}

}
