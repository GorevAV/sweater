package com.example.sweater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSenderService {
    @Autowired
    private JavaMailSender mailSender;

    @Value("%{spring.mail.username}")
    private String username;
    public void send(String emailTo, String subject, String text){

        SimpleMailMessage mailMessagee = new SimpleMailMessage();
        mailMessagee.setFrom(username);
        mailMessagee.setTo(emailTo);
        mailMessagee.setSubject(subject);
        mailMessagee.setText(text);

        mailSender.send(mailMessagee);
    }

}
