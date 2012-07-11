package org.atmars.service;


import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.jasypt.util.password.BasicPasswordEncryptor;

public class Jmail {

	private String serverURL = "http://cloudzfy-pc:8080/atmars/";
	private String logo_img = "weibo-img/logo.png";
	private String poster_img = "weibo-img/poster.png";
	private String name = "atmars.com";
	private String pwd = "rjxyei2012";
	private String from = "atmars.com@gmail.com";
	public String sendEmail(String email, String nickname, Date date) {
		
		String plain = email + nickname + date.getTime();
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		String encrypted = passwordEncryptor.encryptPassword(plain);
		String to = email;
		String subject = "AtMars Microblog New User Register Comfirmation Email";
		String content = "<div style='width:713px; background-color:#A1E0E9; padding-top:30px; padding-bottom:30px; margin: 0 auto;'><img src='" + serverURL + logo_img + "' width='160' /><img src='" + serverURL + poster_img + "' width='100%' /><div style='background-color:#FFFFFF; border-radius:3px; box-shadow:0 1px 3px rgba(0,0,0,0.25); border:1px solid #CCC; padding:20px 20px 20px 20px; margin-left:30px; margin-right:30px; margin-top:30px;'><p><b>Welcome to AtMars MicroBlog</b></p><p>Thank you for registering AtMars MicroBlog.</p><p>To comfirm the email address you provided during registration. please click the following link in 24 hours:</p><p><a href='" + serverURL + "checkEmail?email=" + email + "&ticket=" + encrypted + "'>" + serverURL + "checkEmail?email=" + email + "&ticket=" + encrypted + "</a></p><p>If this link does not work, copy and paste the link into your browser.</p></div></div>";
		
		Properties props = System.getProperties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.setProperty("mail.smtp.auth", "true");
		
		Authenticator auth = new MailAuthenticator(name, pwd);
		Session session = Session.getDefaultInstance(props, auth);
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;CHARSET=utf8");
			Transport.send(message);
		} catch(MessagingException e){
		}
		return encrypted;
	}
	
	public boolean checkLink(String email, String nickname, Date date, String encrypted) {
		
		String plain = email + nickname + date.getTime();
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		if(!passwordEncryptor.checkPassword(plain, encrypted))
		{
			return false;
		}
		Date now = new Date();
		if(now.getTime() - now.getTime() > 86400000)
		{
			return false;
		}
		String subject = "Your New Account in AtMars Microblog has been Activated";
		String content = "<div style='width:713px; background-color:#A1E0E9; padding-top:30px; padding-bottom:30px; margin: 0 auto;'><img src='" + serverURL + logo_img + "' width='160' /><img src='" + serverURL + poster_img + "' width='100%' /><div style='background-color:#FFFFFF; border-radius:3px; box-shadow:0 1px 3px rgba(0,0,0,0.25); border:1px solid #CCC; padding:20px 20px 20px 20px; margin-left:30px; margin-right:30px; margin-top:30px;'><p><b>Welcome to AtMars MicroBlog</b></p><p>Congratulations to you! Your email account " + email + " is activated. Thank you for registering AtMars MicroBlog.</p><p>Try to use AtMars to follow your friends:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<a href='" + serverURL + "'>" + serverURL + "</a></p><p>We are glad to meet you in AtMars MicroBlog.</p></div></div>";
		String to = email;
		
		Properties props = System.getProperties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.setProperty("mail.smtp.auth", "true");
		
		Authenticator auth = new MailAuthenticator(name, pwd);
		Session session = Session.getDefaultInstance(props, auth);
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;CHARSET=utf8");
			Transport.send(message);
		} catch(MessagingException e){
		}
		return true;
	}
}