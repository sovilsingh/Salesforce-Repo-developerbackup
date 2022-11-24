global class CreateAccountEmailService implements Messaging.InboundEmailHandler
{
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelop)
    {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String accName = email.subject;
        String accDes = email.plainTextBody;
        String accIndus = email.subject;
        
        account acc = new Account( Name=accName, Description=accDes, Industry=accIndus );
        insert acc;
        return null;
    }
}