public class CL_29June2022_RetriveData 
{
    @AuraEnabled
    public static Account givedata()
    {
        
        Account acc = [Select ID, Name, Phone, Industry, Rating From Account Limit 1];
        return acc;
    }

}