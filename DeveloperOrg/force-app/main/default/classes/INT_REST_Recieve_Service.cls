@RestResource(urlmapping= '/createAccount/*')
Global class INT_REST_Recieve_Service 
{
     @HttpPost
     global static string callme(String name, String phone, String Industry)
     {
         
         System.JSONGenerator js = JSON.createGenerator(true);
         js.writeStartObject();
         
         try{
             
             Account acc = new Account();
             acc.Name = name;
             acc.Phone = phone;
             acc.Industry = Industry;
             
             Insert acc;
             
             Js.writeStringField('Status', 'Success');
             Js.writeStringField('AccountID',acc.Id);
             
         }
          catch( exception e)
          {
             Js.writeStringField('Status', 'Failed');
             Js.writeStringField('AccountID', e.getMessage());
          }
         
         Js.writeEndObject();
         String result = js.getAsString();
         return result;
     }
    
    @HttpGet
    Global Static String Invokeme()
    {
        RestRequest request = RestContext.request; //to retrive data from endpoint
        Map<String,String> urlMap = request.params;// Passing values to map variable
        System.JSONGenerator js = JSON.createGenerator(true);
        js.writeStartObject();
        
        try{
            
            Account acc = new Account();
            acc.Name = urlMap.get('name');
            acc.Phone = urlMap.get('phone');
            acc.Industry = urlMap.get('industry');
            insert acc; 
             js.writeStringField('Status', 'Success');
             js.writeStringField('AccountID',acc.Id);
        }         
        catch( exception e)
        {
            
             js.writeStringField('Status', 'Failed');
             js.writeStringField('AccountID', e.getMessage());
            
        }
        
        Js.writeEndObject();
        String result = js.getAsString();
        return result;
        
    }
}