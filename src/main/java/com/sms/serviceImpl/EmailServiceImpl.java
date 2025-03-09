package com.sms.serviceImpl;

import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailServiceImpl {

	public boolean sendEmail(String to, String message, String subject) {
	    boolean f = false;
	    String from = "metangesagar@gmail.com";

	    // Variable Gmail Host
	    String host = "smtp.gmail.com";

	    // Get the system properties
	    Properties properties = System.getProperties();
	    System.out.println("Properties: " + properties);

	    // Setting important info to properties object
	    properties.put("mail.smtp.host", host);
	    properties.put("mail.smtp.port", "465");
	    properties.put("mail.smtp.ssl.enable", "true");
	    properties.put("mail.smtp.auth", "true");

	    // Step 1: Get the Session Object
	    Session session = Session.getInstance(properties, new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication("sagar@gmail.com", "123");
	        }
	    });

	    session.setDebug(true);

	    // Step 2: Compose the message
	    MimeMessage m = new MimeMessage(session);

	    try {
	        // From email
	        m.setFrom(new InternetAddress(from));

	        // Adding Recipient
	        m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	        // Adding subject to message
	        m.setSubject(subject);

	        // Adding text to message
	        m.setContent(message, "text/html"); // Ensure HTML content is properly formatted

	        // Step 3: Send the mail
	        Transport.send(m);

	        System.out.println("Sent Successfully.......");
	        f = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}

}

//"metangesagar545@gmail.com","Sagar@4526#"