@isTest
public class AccountCalculatorTest {

    @isTest
    Private Static void countContactsTest()
    {
        List <Account> accList = new List<Account>();
        
        for (Integer i = 0 ; i < 250; i++)
        {
            accList.add(new Account(Name = 'Test'+i));
        }
        
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc : accList)
        {
            conList.add(new Contact(FirstName = 'Test', LastName = acc.Name, AccountId = acc.Id));
            accIds.add(acc.Id);
        }
        
        Insert conList;
        
        Test.startTest();
        AccountCalculator.countContacts(accIds);
        Test.stopTest();
        
        List<Account> accs = [ Select Id, Number_of_Contacts__c from Account ];
        System.assertEquals(1, accs[0].Number_of_Contacts__c, 'Contacts are not counted Succesfully');
        
    }
    
}