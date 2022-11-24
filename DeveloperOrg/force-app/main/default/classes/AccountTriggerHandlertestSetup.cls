@isTest
public class AccountTriggerHandlertestSetup {
    
    
    @testSetup
    private static void Setup()
    {
        
        List<Account> accList = new list<Account>();
        for(Integer i =0; i < 2; i++) {
        Account acc = new Account();
        acc.Name = 'Test'+i;
        acc.BillingCity = 'TestCity';
        acc.BillingCountry = 'TestCountry';
        acc.BillingState = 'TestState';
        acc.BillingStreet = 'TestStreet';
        acc.BillingPostalCode = '12345';
        if(i==0)
        {
            acc.CopyBillingAddToShipping__c = true;
        }
        accList.add(acc);
          }
        
        insert accList;       
    }
    
  //  @isTest
   // private static void copyBillingToShippingInsertTest()
   // {
   //     List<Account> accList = new list<Account>();
   //     for(Integer i =0; i < 2; i++) {
   //     Account acc = new Account();
   //     acc.Name = 'Test';
   //     acc.BillingCity = 'TestCity';
   //     acc.BillingCountry = 'TestCountry';
    //    acc.BillingState = 'TestState';
    //    acc.BillingStreet = 'TestStreet';
   //     acc.BillingPostalCode = '12345';
   //     acc.CopyBillingAddToShipping__c = true;
  //      accList.add(acc);
//          }
        
    //    Test.startTest();
    //    insert accList;
    //    Test.stopTest();
   //     Account updateAcc = [ Select Id, ShippingCity From Account Where Id =: accList[1].Id];
   //     System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
        
 //   }
    
    
     @isTest
    private static void copyBillingToShippingUpdateTest()
    {
    //   List<Account> accList = new list<Account>();
    //    for(Integer i =0; i < 2; i++) {
   //     Account acc = new Account();
    //    acc.Name = 'Test';
     //   acc.BillingCity = 'TestCity';
     //   acc.BillingCountry = 'TestCountry';
    //    acc.BillingState = 'TestState';
    //    acc.BillingStreet = 'TestStreet';
    //    acc.BillingPostalCode = '12345';
   //     accList.add(acc);
   //       } 
   //       
        //  New Code
        
        Account acc = [ Select Id, CopyBillingAddToShipping__c, BillingCity From Account Where Name = 'Test1' Limit 1  ];
        Test.startTest();
       // insert accList;
        
     //   for( Integer i = 0; i < 2; i++)
      //  {
      //      accList[i].CopyBillingAddToShipping__c = true;
     //   }
        acc.CopyBillingAddToShipping__c = true;  
       // update accList;
         update acc;
        Test.stopTest();
   //     Account updateAcc = [ Select Id, ShippingCity From Account Where Id =: accList[1].Id];
           Account updateAcc = [Select Id, ShippingCity From Account Where Id =: acc.Id];
         //  System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
             System.assertEquals(acc.BillingCity, updateAcc.ShippingCity);     
    }

}