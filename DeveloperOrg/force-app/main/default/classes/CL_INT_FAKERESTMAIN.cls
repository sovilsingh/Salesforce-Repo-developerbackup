global class CL_INT_FAKERESTMAIN implements HttpCalloutMock
{
  global HTTPResponse respond(HttpRequest req)
  {
      String endpoint = req.getEndpoint();
      String method = req.getMethod();
      
      System.assertEquals('https://www.sovilsingh.com', endpoint);
      System.assertEquals('GET', method);
      
      HttpResponse response = new HttpResponse();
      response.setBody('Test Karlo');
      response.setStatusCode(200);
      return response;
      
      
  }
}