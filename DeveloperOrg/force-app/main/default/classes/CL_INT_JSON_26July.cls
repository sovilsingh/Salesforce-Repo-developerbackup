public class CL_INT_JSON_26July {

    public void CreateJson(String Nm, String Phn, String Indsty)
    {
        System.JSONGenerator js = JSON.createGenerator(true);    // Step 1 - Create JSON Generator
        js.writeStartObject();                                  //Step 2 - Start writing to JSON 
        try
        {
           Account acc = new Account();
            acc.Name = Nm;
            acc.Phone = Phn;
            acc.Industry = Indsty;
            Insert acc;
            
            js.writeStringField('Status', 'Success'); //Step 3 - write to JSON as Pr requirement
            js.writeIdField('AccId', acc.Id);
            js.writeStringField('Msg', 'Account Created Successfully');
            js.writeNumberField('Code', 100);
        }
        catch(exception e)
        {
            js.writeStringField('Status', 'Failed');
            //js.writeIdField('AccId', acc.Id);
            js.writeStringField('Msg', e.getMessage());
            js.writeNumberField('Code', 200);
        }
        
        
        js.writeEndObject();                                    //Step - End Writing to JSON
        String Result = js.getAsString();                       //Step - Get the final output JSON
        System.debug(Result);                                   //Step - see/check the output      
    }
}