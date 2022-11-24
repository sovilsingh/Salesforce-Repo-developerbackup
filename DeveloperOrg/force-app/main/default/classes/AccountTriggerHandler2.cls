public class AccountTriggerHandler2 {
    //Update Account Description
    public static void UpdateDescription(List<Account> newList)
    {
        for(Account acc : newList)
        {
            if(acc.Industry != null && acc.Industry == 'Media')
            {
                acc.Rating = 'Hot';
            }
        }
    }
    
    //Update account Description if account phone is updated
    public Static void UpdatePhoneDescription(List<Account> newList, Map<id,Account> oldMap)
    {
        for(Account acc : newList)
        {
            if(oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone)
            {
                acc.Description = 'Phone is Modified on Account = '+acc.Phone ;
            }
        }
    }
    
    
    public static void CheckAccountStatus ( List<Account> oldList)
    {
        for(Account acc : oldList)
        {
            if(acc.Active__c == 'Yes')
            {
                acc.addError('Sorry ! you cannot delete accounts which are in active state');
            }
        }
    }
    
    

}