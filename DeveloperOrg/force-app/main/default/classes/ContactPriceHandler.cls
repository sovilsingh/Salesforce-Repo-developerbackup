public class ContactPriceHandler {
    
    public static void SumPrice(List<Contact> listcon)
    {
        System.debug(listcon);
         Set<Id> accIds = new Set<Id>(); 
     {
        for(Contact con : listcon)
         {
         accIds.add(con.AccountId);
         }
     }
     
   List<Contact> conList = [Select Id, AccountId, Contact_Price__c from Contact Where AccountId IN : accIds];
  
   Map<Id,Decimal> accPriceMap = new Map<Id,Decimal>();
    
   for(Contact con : conList)
    {
         Decimal price;
        if(accPriceMap.containsKey(con.AccountId))  
        {    
            if(con.Contact_Price__c != null)
             {
            price = accPriceMap.get(con.AccountId) + con.Contact_Price__c;
            accPriceMap.put(con.AccountId, price); 
             }
        }
        else
        {
            if(con.Contact_Price__c != null)
             {
            accPriceMap.put(con.AccountId, con.Contact_Price__c);
             }
        }
    }
    List<Account> accList = new List<Account>();
    for(Id accId : accPriceMap.keySet())
    {
        Account acc = new Account();
        acc.Total_Contact_Amount__c = accPriceMap.get(accId);
        acc.Id = accId;
        accList.add(acc);
    }
    update accList;
    }
}