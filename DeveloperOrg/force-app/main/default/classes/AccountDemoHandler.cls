public class AccountDemoHandler {

    
    
    Public Static void AccountHandlerDuplicateNameUpdate(List<Account> accListtrigger)
    {
        List<String> accNameList = new List<String>();
        for(Account accloop : accListtrigger)
        {
            //Account acc = [Select ID, Name, Active__c from Account Where Name =:accloop.Name];
            accNameList.add(accloop.Name);
         
        }
        
        List<Account> accList = [Select ID, Name, Active__c from Account Where Name IN:accNameList];
        
        if(accList.size()>0)
        {
            for(Account acc: accList)
            {
                acc.Active__c = 'No';
            }
        }
        
        update accList;
    }
    
    public static void DuplicateNameErroMessage(List<Account> accListtrigger)
    {
             
        for(Account acc : accListTrigger)
        {
            
        List<Account> accList = [Select ID, Name From Account where Name =:acc.Name];
     
        if(accList.size()>0)
        {
          acc.Name.addError('Duplicate Name Found');
        }
        }
    }
    
     public static void deleteSameNameContact(List<Account> accList)
     {
         
          List<string> conList = new List<String>();
         
         for(Account acc : accList)
         {
             conList.add(acc.Name);
         }
         
        List<Contact> conListDel = [Select Id, LastName From Contact Where LastName IN:conList];
         
        if(conListDel.size()>0)
        {
            delete conListDel;
        }
         
         
     }
}