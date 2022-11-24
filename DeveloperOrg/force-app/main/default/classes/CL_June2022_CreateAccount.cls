public class CL_June2022_CreateAccount 
{
    @AuraEnabled
    public static String CreateAccounts(String Name, String Rating, String Phone, String Industry)
    {
        string Result;
        try{
            
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = Phone;
        acc.Rating = Rating;
        acc.Industry = Industry;
        insert acc;
        Result = 'Account creating Successfully======>'+acc.Id;
      
        }
        catch(exception e)
        {
             Result = 'Account Creation Failed========> '+e.getMessage();
           
        }  
        return Result;    
    }
    
}