public class EmailClassService 
{
     public static void SendSingleMail()
     {
         Messaging.SingleEmailMessage smail = new Messaging.SingleEmailMessage();
         List<String> sendingEmail = new List<String>{'Singhsovil@gmail.com'};
         smail.setToAddresses(sendingEmail);
         smail.setSubject('Test EMail for single Email Class');
         smail.setPlainTextBody('Hello how are you ??? I hope you are enjoying the classes. Thankyou');
         Messaging.sendEmail(new Messaging.SingleEmailMessage[] {smail});
         
         
     }
}