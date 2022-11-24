public class AccountCustomController {

    public PageReference Savetherecord() {
        
        update account;
        return null;
    }


    Private final Account account;
    
    public AccountCustomController()
    {
    
    account = [Select Id, name, Site from Account where Id =: ApexPages.currentPage().getParameters().get('id')];
    
    }
    
    public Account getAccount()
    {
      return account;
    
    }
}