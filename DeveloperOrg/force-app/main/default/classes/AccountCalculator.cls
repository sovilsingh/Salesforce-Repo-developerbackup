public class AccountCalculator {
    
    @future
    Public Static Void countContacts(List<Id> accids )
    {
        
        List<Account> accList = [ Select Id, ( Select ID from Contacts) From Account where ID IN : accids];
        
        for ( Account acc : accList)
        {
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
        
        if(!accList.isEmpty())
        {
            update accList;
        }
    }

}