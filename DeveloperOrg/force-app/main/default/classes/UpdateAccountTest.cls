@isTest
public class UpdateAccountTest {

    @isTest
private static void testupdateAccount()
{
    Account acc = new Account();
    acc.Name = 'Test Account';
    acc.Active__c = 'Yes';
    acc.Rating = 'Cold';
    insert acc;
    
    contact con = new Contact();
    con.FirstName = 'Test';
    con.LastName = 'Test';
    con.AccountId = acc.Id;
    insert con;
    
    UpdateAccount.updateAccounts();
    
    Account updateAcc = [Select id, Active__c, Rating from Account Where Id =: acc.Id];
    System.assertEquals('Hot', updateAcc.Rating);
 }           
}