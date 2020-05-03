package com.ecom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartProducts {

	public static ArrayList<Product> getCart(String username) throws SQLException{
		ArrayList<Product> cart = new ArrayList<Product>();
		Connection con = DB.getDataSource().getConnection();
		PreparedStatement pst = con.prepareStatement("select PRODUCT_ID,PROD_QTY from ecom_cart where email=?");
		pst.setString(1, username);
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			Product product = new Product();
		String p_id = rs.getString("PRODUCT_ID");
		int p_qty = rs.getInt("PROD_QTY");
		product.setP_id(p_id);
		product.setP_qty(p_qty);
		PreparedStatement pst2 = con.prepareStatement("select PROD_NAME,PROD_IMG,PRICE from ecom_flowers where PRODUCT_ID=?");
		pst2.setString(1, p_id);
		ResultSet rs2 = pst2.executeQuery();
		rs2.next();
		String p_name = rs2.getString("PROD_NAME");
		String p_img = rs2.getString("PROD_IMG");
		int p_price = rs2.getInt("PRICE");
		product.setP_name(p_name);
		product.setP_img(p_img);
		product.setP_price(p_price);
		product.setP_qty(p_qty);
		cart.add(product);
		
		}
		con.close();
		return cart;
		
	}
}
