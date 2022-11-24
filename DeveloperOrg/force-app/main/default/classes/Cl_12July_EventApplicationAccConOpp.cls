public class Cl_12July_EventApplicationAccConOpp 
{
    @AuraEnabled
    public static String search(string accname, String accind)
    {  
        string accId;
        List<Account> accounts = [Select Id, Name, Phone, Rating, Industry from account where Name =: accname and Industry=: accind];
        
        if(accounts.size()==0)
        {
            accId='Error';
        }
        else
        {
            accId = accounts[0].id;
        }
        
        return accId;
    }
    
     @AuraEnabled
    public static List<Contact> getcontacts(string accId)
    {
       List<Contact> contacts = [Select id, FirstName, LastName, Email from Contact where AccountId =: accId];
        return contacts;  
    }
     @AuraEnabled
    public static List<Opportunity> getopp(string accId)
    {
        List<Opportunity> opps = [Select id, Name, StageName, Amount from Opportunity where AccountId =: accId];
        return opps;
    }
}