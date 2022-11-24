public class CL_06July2022_AccountCreation {
    
    @AuraEnabled
    public static string InsertAccount(Account acc)   
    {
        string result;
        
        try{
            
            insert acc;
            result = acc.id;
        }
        catch(Exception e)
        {
            result = 'Failed';
        }
        
        return result;
    }

    
    @AuraEnabled
    public static List<Account> getData()
    {
       
       List<Account> accounts = [Select id, Name, Phone, Rating, Industry from account order by CreatedDate desc];
       return accounts;
    }
    
}