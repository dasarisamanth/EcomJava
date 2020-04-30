package com.ecom;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;





public class Emailer {

	
	public static void email(String address,String message) throws IOException, MessagingException {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.port", "587");
		
		String myEmail = "smtpemails25@gmail.com";
		String pass ="smtp@4321";
		
		
		Session ses = Session.getInstance(prop, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myEmail,pass);
				
			}
		});
		Message  msg = new MimeMessage(ses);
		try {
			msg.setFrom(new InternetAddress(myEmail));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try { 
			msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		msg.setSubject("Account Password Reset");
		msg.setText(message);
		System.out.println("Email Sent Successfully");
		Transport.send(msg);
		
	}
	
		
		
		
		
		
		
	
}