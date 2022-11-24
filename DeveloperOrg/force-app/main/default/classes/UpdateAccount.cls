public class UpdateAccount {
    
    public static void updateAccounts()
    {
        
        List<Account> accToBeUpdated = new List<Account>();
        Set<id> accIdSet = new Set<Id>();
        
        for(Contact con : [ Select Id, Account.ID From Contact Where Name Like '%Test%' And Account.ID != null])
        {
            if(!accIdSet.contains(con.Account.ID))
            {
                Account acc = new Account();
                acc.Id = con.Account.Id;
                acc.Active__c = 'Yes';
                acc.Rating = 'Hot';
                accToBeUpdated.add(acc);
                accIdSet.add(con.Account.Id);
            }
        }
        
        if(!accToBeUpdated.isEmpty())
        {
            update accToBeUpdated;
        }
    }

}