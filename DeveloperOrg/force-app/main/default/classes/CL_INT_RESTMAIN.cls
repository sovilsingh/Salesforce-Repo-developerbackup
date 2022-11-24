public class CL_INT_RESTMAIN 
{
      
      public void Invoke()
      {
          String endpoint = 'https://www.sovilsingh.com';
          Http portcl = New Http();
          
          HttpRequest request = new HttpRequest();
          request.setEndpoint(endpoint);
          
          request.setMethod('GET');
          HttpResponse response = portcl.send(request);
          String result = response.getBody();
          
          Account acc = new Account();
          acc.Name = result;
          Insert acc;

      }
}