package com.spring.project;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestClass {

	@Autowired
	private JavaMailSender mailSender;

	
	@Test
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
    public void sendMailTest2() throws Exception{
 
        String subject = "test 메일";
        String content = "메일 테스트 내용.";
        String from = "************";
        String to = "*************";
        
        
        final MimeMessagePreparator preparator = new MimeMessagePreparator() {
            
            public void prepare(MimeMessage mimeMessage) throws Exception{
                final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                
                mailHelper.setFrom(from);
                mailHelper.setTo(to);
                mailHelper.setSubject(subject);
                mailHelper.setText(content, true);
 
            }
            
        };
        
        try {    
            mailSender.send(preparator);
            
        } catch(Exception e) {
            e.printStackTrace();
        }        
        
    }

}
