@isTest
public class TestSetupApex {

    @testSetup
    private static void Setup()
    {
        List<Account> accList = new List<Account>();
        
        for(Integer i=0; i < 2; i ++)
        {
            Account acc = new Account();
            acc.Name  = 'Test' + i;
            accList.add(acc);
        }
        
        insert accList;
    }
    
     @isTest
    private static void method1()
    {
       Account acc1 = [ Select Id, Name, Phone From Account Where Name = 'Test0' ];
            
       acc1.Phone = '123456';
       update acc1;
        
       Account acc2 = [Select Id, Name, Phone From Account Where Name = 'Test1'];
       delete acc2;
       
    }
    
    @isTest
    Private Static Void Method2()
    {
       Account acc1 = [ Select Id, Name, Phone From Account Where Name = 'Test0' ];
       System.assertEquals(null, acc1.Phone);
    }
}