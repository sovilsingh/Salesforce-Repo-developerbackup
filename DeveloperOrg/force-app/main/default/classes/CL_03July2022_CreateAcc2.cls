public class CL_03July2022_CreateAcc2 {
    
    @AuraEnabled
    public static string callAccounts(Account acc)
    {
        String result;
        
        try{
              Insert acc;
              result = 'Success';
           }
        catch(Exception e)
          {
            
            result= e.getMessage();
          }
        
        return result;
    }

}