trigger AccountTriggerPlatfromEvent on Account (before insert) 
{
       if(Trigger.isAfter && Trigger.isUpdate)
       {
           List<Account_Platform_Event__e> listOfAccount = new List<Account_Platform_Event__e>();
           
           for(Account acc : Trigger.new)
           {
               Account_Platform_Event__e platfromevt = new Account_Platform_Event__e();
               platfromevt.Account_Name__c = acc.Name;
               platfromevt.Account_Phone__c = acc.Phone;
               platfromevt.Salary__c = acc.AnnualRevenue;
               listOfAccount.add(platfromevt);
           }
           
           if(listOfAccount.size() > 0)
           {
               EventBus.publish(listOfAccount);
           }
       }
}