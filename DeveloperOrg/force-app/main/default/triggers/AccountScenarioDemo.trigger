trigger AccountScenarioDemo on Account (before delete, before Insert) 
{ 
    /*
     if(trigger.isDelete && trigger.isBefore)
     {
     Set<Id> parentIds = new Set<Id>();
     List<Account> accList = [Select ID From Account Where ID IN : Trigger.old];
     List<Contact> conList = [Select account.id From contact where account.Id IN : accList];
         for(Contact con : conList)
            {
             parentIds.add(con.AccountId);
            }
         for(Account acc : Trigger.old )
            {
             if(parentIds.contains(acc.Id))
                {
                 acc.addError('Cannot Delete Account Because It Has Related Contacts');
                }
        }
     }
    
  if(trigger.isBefore && trigger.isDelete)
  {
   ID profileID = UserInfo.getProfileId();
   String ProfileName = [Select ID, Name From Profile Where ID =: profileID].Name;

   for(Account acc: trigger.old)
   {
       if(ProfileName == 'System Administrator')
        {
          acc.addError('You are not allowed to delete Contact records');
        }
   }
  }
    
    if(trigger.isInsert && trigger.isBefore)
    {
     
      // List<String> nameList = new List<String>();
       Set<String> nameList = new Set<String>();
       for(Account acc : trigger.new)
       {
         nameList.add(acc.Name);
       }   
       List<Account> accList = [Select ID, Name From Account Where Name IN : nameList];     
        for(Account acc : trigger.new )
         {
        // if(accList.size() > 0)
          if(nameList.contains(acc.Name))
         {    
          acc.addError('Duplicate Name Found');
         }
       } 
    } 
        */
        
      if(trigger.isAfter && trigger.isDelete)
      {
        Set<id> listset = new Set<id>();
        for(Account acc: trigger.old)
        {
            listset.add(acc.id);
        }
    
        List<Contact> conList = [Select ID, Name, Phone From Contact Where accountId IN : listset];

        if(conList.size()>0)
        {
           delete conList;
        }
          
      }
        
    
    

}