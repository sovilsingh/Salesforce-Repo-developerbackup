public class AccountTriggerHandler {

     public static void UpdateRating (List<Account> newList)
     {
         for ( Account acc : newList)
         {
             if(acc.Industry != null && acc.Industry == 'Media')
             {
                 acc.Rating = 'Hot';
             } 
         }
     }
    
    public static void CreateRelatedOpp (List<Account> newList)
    {
       List<Opportunity> oppList = new List<Opportunity>();
        
        for ( Account acc : newList)
        {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.AccountId = acc.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            oppList.add(opp);
        }
        
        if (!oppList.isEmpty())
        {
            Insert oppList;
        }
    }
    
    public Static void UpdatePhoneDescription ( List<Account> newList, Map<Id,Account> oldMap)
    {
        for(Account acc : newList)
        {
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone)
            {
                acc.Description = 'Phone is Modifield on Account';
            }
        }
    }
    
    public static void UpdateRelatedOpp(List<Account> newList, Map<id, Account> oldMap)
    {
        Map<Id, Account> accIdToAccount = new Map<id, Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        for ( Account acc : newList)
        {
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone)
            {
                accIdToAccount.put(acc.id, acc);
            }
        }
        
        for(opportunity opp : [ Select Id, Account_Phone__c, AccountId From Opportunity Where AccountId IN : accIdToAccount.KeySet()])
        {
            Opportunity oppor = new Opportunity();
            if(accIdToAccount.containsKey(opp.AccountId))
            {
                oppor.Id = opp.Id;
                oppor.Account_Phone__c = accIdToAccount.get(opp.AccountId).phone;
                oppList.add(oppor);
            }
        }
        if(!oppList.isEmpty())
        {
            update oppList;
        }
    }
}