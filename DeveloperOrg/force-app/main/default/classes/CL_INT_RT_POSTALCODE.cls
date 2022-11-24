public class CL_INT_RT_POSTALCODE 
{
    public List<String> places {set;get;}
    public String pincode  {set;get;}
    
    public Void GetPostalDetails()
    {
        places = new List<String>();
        String endpoint = 'https://api.postalpincode.in/pincode/'+pincode;
        
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HTTPResponse response = http.send(request);
        
        String body = response.getBody();
        
        System.JSONParser json = JSON.CreateParser(body);
        while(json.nextToken() != null)
        {
            if(json.getText()=='Name')
            {
                json.nextToken();
                places.add(json.getText());
            }
        }
    }
}