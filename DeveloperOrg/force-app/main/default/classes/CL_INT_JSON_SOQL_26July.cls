public class CL_INT_JSON_SOQL_26July {

    public void BringAccount()
    {
        
        System.JSONGenerator js = JSON.createGenerator(true);
        
         js.writeStartObject();
          try
          {
              List<Account> acc = [Select Name, Phone from Account];
              for(Account EA : acc)
              {
                  js.writeStringField('Account Name', EA.Name);
                  if(EA.Phone != null)
                  {
                      js.writeStringField('Account Phone', EA.Phone);
                  }
                  
                  js.writeStringField('Status', 'Success');
                  js.writeNumberField('Code', 800);
              }
          }
          Catch(exception e)
          {
                  js.writeStringField('Status', 'Failed');
                  js.writeNumberField('Code', 600);
          }
         js.writeEndObject();
         String OP = js.getAsString();
         System.debug(OP);
    }
}