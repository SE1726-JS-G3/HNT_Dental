package com.hnt.dental.service;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class MailService {
    public static void send(String to, String sub,
                            String msg, final String user, final String pass) {
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.allow8bitmime", "true");
        props.put("mail.smtps.allow8bitmime", "true");
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendMailConfirm(String username, String link, String email) {
        String subject = "[Doctris] Please verify your email.";
        String message = "<!doctype html>\n" +
                "<html lang=\"en\" dir=\"ltr\">\n" +
                "\n" +
                "    <head>\n" +
                "        <meta charset=\"utf-8\" />\n" +
                "        <title>HNT Dental - Khám răng</title>\n" +
                "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "        <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap\" rel=\"stylesheet\">\n" +
                "    </head>\n" +
                "\n" +
                "    <body style=\"font-family: Inter, sans-serif; font-size: 15px; font-weight: 400;\">\n" +
                "\n" +
                "        <div style=\"margin-top: 50px;\">\n" +
                "            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Inter, sans-serif; font-size: 15px; font-weight: 400; max-width: 600px; border: none; margin: 0 auto; border-radius: 6px; overflow: hidden; background-color: #fff; box-shadow: 0 0 3px rgba(60, 72, 88, 0.15);\">\n" +
                "                <thead>\n" +
                "                    <tr style=\"background-color: #396cf0; padding: 3px 0; border: none; line-height: 68px; text-align: center; color: #fff; font-size: 24px; letter-spacing: 1px;\">\n" +
                "                        <th scope=\"col\"><img src=\"../assets/images/logo-light.png\" height=\"22\" alt=\"\"></th>\n" +
                "                    </tr>\n" +
                "                </thead>\n" +
                "                <tbody>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 48px 24px 0; color: #161c2d; font-size: 18px; font-weight: 600;\">\n" +
                "                            Hello, " + username +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 15px 24px 15px; color: #8492a6;\">\n" +
                "                            Thanks for creating an HNT Dental account. To continue, please confirm your email address by clicking the button below :\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 15px 24px;\">\n" +
                "                            <a href="+ link +" style=\"padding: 8px 20px; outline: none; text-decoration: none; font-size: 16px; letter-spacing: 0.5px; transition: all 0.3s; font-weight: 600; border-radius: 6px; background-color: #396cf0; border: 1px solid #396cf0; color: #ffffff;\">Confirm Email Address</a>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 15px 24px 0; color: #8492a6;\">\n" +
                "                            This link will be active for 30 min from the time this email was sent.\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 15px 24px 15px; color: #8492a6;\">\n" +
                "                            HNT Dental <br> Support Team\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td style=\"padding: 16px 8px; color: #8492a6; background-color: #f8f9fc; text-align: center;\">\n" +
                "                            © <script>document.write(new Date().getFullYear())</script> HNT Dental.\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                </tbody>\n" +
                "            </table>\n" +
                "        </div>\n" +
                "    </body>\n" +
                "</html>";
        MailService.send(email, subject, message, "hntdental@gmail.com", "wqkbcrkxgvprcdcc");
    }
}
