trigger AccountDemo on Account (before insert,  After Insert, before update, after update, after delete, before delete, after undelete) {

    //When we are trying to insert new record into object. 
    //If there is any record existing with same account name it should update all the previous record with same name.
    
    if(trigger.isInsert)
    {
        
        
        
       //AccountDemoHandler.AccountHandlerDuplicateNameUpdate(trigger.new);
    }
    
    //When we are trying to insert new record into object. 
    //If there is any record existing with same account name it should 
    //prevent duplicate record.
    if(trigger.isInsert)
    {
     
       // AccountDemoHandler.DuplicateNameErroMessage(trigger.new);   
    }
    
   // Whenever a new record is created into an account object.
   //  Before this new record is inserted into Account, 
   //  delete all the contacts records with this account name.
     if(trigger.isInsert)
     {
      // AccountDemoHandler.deleteSameNameContact(trigger.new);  
     }
    
    //We are having the requirement that when an account record is updated, 
    //we need to update all related contact record phone number field with 
    //the Account phone number.
  // if(trigger.isAfter &&trigger.isUpdate)
   // {
       
    //    List<Contact> conList = new List<Contact>();
        
    //    Set<ID>  ids = new Set<ID>();
        
     //   for(Account acc: trigger.new)
     //   {
    //        ids.add(acc.Id);
    //    }
        
   //     for(Account acc :[Select ID, Name, Phone, (Select ID, Phone From Contacts) from Account where ID IN : ids ])
   //     {
    //        for(contact con : acc.Contacts)
    //        {
    //            con.Phone = acc.Phone;
    //            conList.add(con);
     //       }
     //   }
        
    //    update conList;
  //  }
    
     //Whenever we try to update the phone of account record then update 
     //the related contact phone no. with the new account phone no. before account record is updated.
//When we delete the account record then delete the corresponding Contact records.   
    
    if(trigger.isBefore &&trigger.isUpdate)
    {

   //      Map<Id,Account> mymap = Trigger.newMAp;
    //     List<Contact> conListToUpdate = new List<Contact>();

    //     List<Contact> conList = [Select Id, Phone, accountID from Contact Where accountID IN : mymap.keyset()];

    //    for(Contact con : conList)
   //     {
   //         con.phone = mymap.get(con.AccountId).Phone;
   //         conListToUpdate.add(con);
   //     }

   //     update conListToUpdate;
    }
    
    //if(trigger.isDelete && trigger.isAfter)
   // {
        
    //     Map<Id,Account> mymap = Trigger.oldMap;
    //     List<Contact> conListToUpdate = new List<Contact>();
    //     List<Contact> conList = [Select Id, Phone, accountID from Contact Where accountID IN : mymap.keyset()];
    //   for(Contact con : conList)
    //    {
       //     conListToUpdate.add(con);
 //     }

//       Delete conListToUpdate;
        
  // }
    
    //We are having the requirement to prevent deletion of Account record if it has parent Account associated with it.
    
 //   if(trigger.isBefore && trigger.isDelete)
 //   {
        
   //     for(Account acc : trigger.old)
    //    {
//            if(acc.Name!= null)
//            {
               // acc.addError('You are not able to delete bcz of Name');
     //       }
     //   }
        
  //  }
    
 //   if(trigger.isundelete)
   // {
    //    List<Account> accList = new List<Account>();
    //    List<Account> toupdate = new List<Account>();
        
     //   accList = [Select Id, Name, Description from Account Where ID IN : trigger.newMap.keyset()];
        
    //    for(Account acc: accList)
    //    {
    //        acc.Description = 'Undeleted';
   //         toupdate.add(acc);
   //     }
        
  //      update toupdate;
   // }
    
    if(trigger.isBefore && trigger.isDelete)
    {
   // Map<ID,Account> mymap = Trigger.old;
        
    Set<ID>  ids = new Set<ID>();   
     for(Account acc: trigger.old)
     {
           ids.add(acc.Id);
     }
        
    List<Contact> conListToUpdate = new List<Contact>();
        
    List<Contact> conList = [Select ID, Phone, AccountId from Contact Where accountID In : ids];
    for(Contact con:conList)
     {
       conListToUpdate.add(con);
       
       if(conListToUpdate.size()> 0)
         {
          con.addError('Cant be Deleted Bcz Parent Record Exists');
         }
      }
     
    }
    
    
}