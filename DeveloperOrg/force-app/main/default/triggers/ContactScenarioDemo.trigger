trigger ContactScenarioDemo on Contact (before delete, after update, before Insert, after Insert, after delete) 
{
  /* if(trigger.isDelete && trigger.isBefore)
   {
     
     Set<Id> childIds = new Set<Id>();
     List<Contact> conList = [Select ID From Contact Where Id IN : Trigger.old];
     List<Account> accList = [Select ID,(Select ID From Contacts Where ID IN : conList)From Account];
     //List<Account> accList = [Select ID From Account Where ID IN : Trigger.old];
     //List<Contact> conList = [Select account.id From contact where account.Id IN : accList];
         for(Account acc : accList)
            {
             childIds.add(acc.Id);
            }
         for(Contact con : Trigger.old )
            {
             if(childIds.contains(con.AccountID))
                {
                 con.addError('Cannot Delete Contact Because It Has Related Account');
                }
            }
   }
    
    if(trigger.isAfter && trigger.isUpdate)
    {
    
    Map<Id,String> mymap = new Map<Id, String>(); 
    for(Contact con: trigger.new) {
        mymap.put(con.AccountId, con.phone);
    } 
    List<Account> accList = new List<Account>(); 
    List<Account> accListIds = [Select id, Phone From Account Where Id IN :mymap.Keyset()];
    for(Account acc:accListIds) {
        if(mymap.containsKey(acc.id)) 
        {
            accList.add(new Account(Id = acc.id, Phone = mymap.get(acc.id)));
        }
    }
    update accList;
     
     
    }
    
    if(trigger.isAfter && trigger.isInsert)
    {
    
    Map<Id,String> mymap = new Map<Id, String>(); 
    for(Contact con: trigger.new) {
        mymap.put(con.AccountId, con.phone);
    } 
    List<Account> accList = new List<Account>(); 
    List<Account> accListIds = [Select id, Phone From Account Where Id IN :mymap.Keyset()];
    for(Account acc:accListIds) {
        if(mymap.containsKey(acc.id)) 
        {
            accList.add(new Account(Id = acc.id, Phone = mymap.get(acc.id)));
        }
    }
    update accList;
    }
    
     if(trigger.isAfter && trigger.isInsert)
    {
    
    Map<Id,String> mymap = new Map<Id, String>(); 
    for(Contact con: trigger.new) {
        mymap.put(con.AccountId, con.LastName);
    } 
    List<Account> accList = new List<Account>(); 
    List<Account> accListIds = [Select id, Name From Account Where Id IN :mymap.Keyset()];
    for(Account acc:accListIds) {
        if(mymap.containsKey(acc.id)) 
        {
            accList.add(new Account(Id = acc.id, Name = mymap.get(acc.id)));
        }
    }
    update accList;
    }
    */
    
   /*
    if(trigger.isBefore && trigger.isInsert)
    {
       List<Contact> listOfContact = new List<Contact>();
        
          for (Contact con : trigger.new)   
            {      
                    listOfContact.add(con);       
            }  
        
          if (listOfContact.size() > 0)
            {  
                List<Account> createNewAcc = new List<Account>();
                Map<String,Contact> conNameKeys = new Map<String,Contact>();
                
                for (Contact con : listOfContact)   
                {  
                    String accountName = con.firstname + ' ' + con.lastname;  
                    conNameKeys.put(accountName,con);                      
                    Account accObj = new Account();  
                    accObj.Name = accountName;
                    if(con.phone != null)
                    {
                     accObj.Phone= con.Phone;
                     }
                    accObj.Phone= con.Phone;
                    createNewAcc.add(accObj);  
                }  
                Insert createNewAcc;  
                
                 for (Account acc : createNewAcc)   
                 {   
                    if (conNameKeys.containsKey(acc.Name))   
                    {  
                         conNameKeys.get(acc.Name).accountId = acc.Id;  
                    }  
                }  
            }
    }
*/
    /*
     if(trigger.isBefore && trigger.isInsert)
    {
        
        List<Contact> conList = trigger.new;
  
    if(conList.size()>0)
    {
       List<Account> accList = new List<Account>();
       Map<String,Contact> conNameKeys = new Map<String,Contact>();
       for(contact con : conList )
       {
           Account acc = new Account();
           string accountName = con.firstName+' '+con.LastName;
           conNameKeys.put(accountName,con);
           acc.Name = accountName;
           acc.Phone = con.phone;
           accList.add(acc);
       }
      insert accList;

      for(Account acc: accList)
      {
        if(conNameKeys.containsKey(acc.Name))
         {
           conNameKeys.get(acc.Name).accountId = acc.id;
         }
      }
     }  
    }
  */
    /*
    if(trigger.isAfter && trigger.isInsert)
    {
        Set<ID> ids = new Set<ID>();
  for(Contact con : trigger.New)
  {
      ids.add(con.accountid);
  }
  List<Contact> conList = [Select Id, AccountID, Name From Contact Where AccountID IN : ids];

  Map<Id,Decimal> totalconMap = new Map<Id,Decimal>();
  
   for(Contact con: conList)
    {
      if(totalconMap.containskey(con.AccountID))
         {
            Decimal noContact = totalconMap.get(con.AccountID)+1;
            totalconMap.put(con.AccountID,noContact);
         }
        else
         {
            totalconMap.put(con.AccountID,1);
         }
    }
    List<Account> accList = new List<Account>();
    for(ID aid : totalconMap.keyset())
    {
        Account acc = new Account();
        acc.TotalContacts__c = totalconMap.get(aid);
        acc.id = aid;
        accList.add(acc);
    }
    update accList;
    }
   */
    
    if(trigger.isInsert)
    {
    Set<Id> accountIds = new Set<Id>();
     
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(Contact con:trigger.new){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
    if(trigger.isUpdate || trigger.isDelete){
        for(Contact con:trigger.old){
            if(con.AccountId != null){
                accountIds.add(con.AccountId);
            }
        }
    }
    
     if(!accountIds.isEmpty()){
        List<Account> accList = [SELECT Id, TotalContacts__c, (SELECT Id FROM Contacts) 
                                 FROM Account WHERE Id IN : accountIds];
        if(!accList.isEmpty()){
            List<Account> updateAccList = new List<Account>();
            for(Account acc:accList){
                Account objAcc = new Account(Id = acc.Id, TotalContacts__c = acc.Contacts.size());
                updateAccList.add(objAcc);
            }
            if(!updateAccList.isEmpty()){
                update updateAccList;
            }
        }
    } 
}
    /*
    if(trigger.isAfter && trigger.isInsert || trigger.isAFter && trigger.isUpdate)
    {
        Set<ID> accIds = new Set<Id>();     
        for(Contact con: Trigger.new)
        {   System.debug(con.AccountId);
            accIds.add(con.AccountId);
        }
        
        List<Contact> conList = [Select Id, AccountID, Contact_Price__c From Contact Where AccountId IN : accIds];
        //System.debug(conList);
        Map<ID, Decimal> accPriceMap = new Map<ID, Decimal>();
        for(Contact con : conList)
        {
            //System.debug(con);
            if(accPriceMap.containsKey(con.AccountId))
            {       
                if(con.Contact_Price__c != null)
               {  
                  Decimal  price = accPriceMap.get(con.AccountId) + con.Contact_Price__c; 
                  accPriceMap.put(con.AccountId,price);
               }
            }
            else
            {
                accPriceMap.put(con.AccountId,con.Contact_Price__c);
            }
        }
        List<Account> accList = new List<Account>();
        for(ID accId : accPriceMap.keyset())
        {
            Account acc = new Account();
            acc.Total_Contact_Amount__c = accPriceMap.get(accId);
            acc.Id = accId;
            accList.add(acc);
        }
      update accList;
    }
    
    /*
    if(trigger.isAfter && trigger.isDelete)
    {
        Set<ID> accIds = new Set<id>();
        for(Contact con: Trigger.old)
        {
            accIds.add(con.AccountId);
        }
      
        
        List<Contact> conList = [Select Id, AccountID, Contact_Price__c From Contact Where AccountID IN : accIds];
        Map<ID, Decimal> accPriceMap = new Map<Id, Decimal>();
        for(Contact con : conList)
        {
            if(accPriceMap.containsKey(con.AccountId))
            {
                Decimal price = accPriceMap.get(con.AccountId) + con.Contact_Price__c; 
                accPriceMap.put(con.AccountId,price);
            }
            else
            {
                accPriceMap.put(con.AccountId,con.Contact_Price__c);
            }
        }
        List<Account> accList = new List<Account>();
        for(ID accId : accPriceMap.keyset())
        {
            Account acc = new Account();
            acc.Total_Contact_Amount__c = accPriceMap.get(accId);
            acc.Id = accId;
            accList.add(acc);
        }
        update accList;
    }
*/
}