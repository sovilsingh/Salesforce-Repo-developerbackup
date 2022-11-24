public class CL_INT_RT_LEADtoSMS 
{
       @future(callout=true)
       public static void SendMessage(Set<id> leadids)
       {
           List<Lead> leads = [Select ID, Mobile_Number__c , FirstName from Lead Where Id in : leadids];
           
           for(Lead el : leads)
           {
               Http p = new Http(); 
               HttpRequest request = new HttpRequest();
               String endpoint = 'https://api.textlocal.in/send/?';
               endpoint = endpoint+'apikey=MzU2NDM0NjEzNjRmNDQ2MzY5NjI3MTYzNjIzMTYyNDY=';
               endpoint = endpoint+'&numbers='+'91'+ el.Mobile_Number__c;
               endpoint = endpoint+'&sender=TXTLCL';
               endpoint = endpoint+'&message=Welcome to SMS Integration done by Sovil Singh';
               request.setEndpoint(endpoint);
               request.setMethod('GET');
               
               HttpResponse response = p.send(request);
               
           }
       }
}