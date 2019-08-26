package kr.co.realty.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
   
public class EmailSender  {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailSender.class);
     
    private JavaMailSender mailSender;
    

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public boolean SendEmail(Email email) throws Exception {
        
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg, true);
        try {
        	
//        	helper.setFrom( "foundation@dongbu.com");
        	helper.setFrom( email.getSender());
            helper.setSubject( email.getSubject() );
            helper.setText( email.getContent(), true);
            helper.setTo( InternetAddress.parse( email.getReceiver() ));
           
        }catch(MessagingException e) {
        	logger.error ("MessagingException발생", e);
            e.printStackTrace();
            return false;
        }
        try {
            mailSender.send(msg);
        }catch(MailException e) {
//        	logger.info("MailException발생");
        	logger.error ("MailException발생", e);            
            return false;
        }
        return true;
    }
	
	public boolean SendFileEmail(Email email, List<Map<String,Object>> multifileInfo) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");		
		try {

			helper.setFrom( email.getSender());
			helper.setSubject( email.getSubject() );
			helper.setText( email.getContent(), true);
			helper.setTo( InternetAddress.parse( email.getReceiver()));
			
			for(Map<String,Object> v : multifileInfo){
//				File file = new File((String) v.get("FILE_PATH")+(String) v.get("STORED_FILE_NAME"));
				FileSystemResource file = new FileSystemResource(new File((String) v.get("FILE_PATH")+(String) v.get("STORED_FILE_NAME")));

				String fileName = MimeUtility.encodeText((String) v.get("ORIGINAL_FILE_NAME"), "euc-kr","B");				
				helper.addAttachment(fileName,file);
			}
			
			
		}catch(MessagingException e) {
			logger.error ("MessagingException발생", e);
			e.printStackTrace();
			return false;
		}
		try {
			mailSender.send(msg);
		}catch(MailException e) {
			logger.error ("MailException발생", e);            
			return false;
		}
		return true;
	}
}
