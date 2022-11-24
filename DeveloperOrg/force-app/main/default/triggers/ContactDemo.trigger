trigger ContactDemo on Contact ( before insert)
{

    //Whenever a new Contact is created for an account update the corresponding 
    //account phone with the new Contact phone field.
      
    //   if(trigger.isAfter)
  //  {
  //    List<Account> accList = new List<Account>();
  //      
  //     for(Contact con: trigger.new)
  //    {
  //      Account acc = [Select ID, Phone From Account Where ID=:con.AccountID];
   //       acc.Phone = con.Phone;
 //           accList.add(acc);
  //     }
        
  //   update accList;
 //   }

    /*
    Map<Id,String> accountIdwithContactField = new Map<Id, String>(); 
    for(Contact con:trigger.new) {
        accountIdwithContactField.put(con.AccountId, con.phone);
    } 
    List<Account> listUpdatedAccount = new List<Account>(); 
    
    for(Account acc:[Select id, Phone From Account Where Id IN :accountIdwithContactField.Keyset()]) {
        if(accountIdwithContactField.containsKey(acc.id)) 
        {
            listUpdatedAccount.add(new Account(Id = acc.id, Phone = accountIdwithContactField.get(acc.id)));
        }
    }
    update listUpdatedAccount;
    
*/
   if(trigger.isBefore && trigger.isInsert)
   {
       contacthandler.insertAccount(trigger.new);
   }
}