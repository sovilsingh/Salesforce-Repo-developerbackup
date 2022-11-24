public class myControllerExtension {

private final Account acct;

    public myControllerExtension(ApexPages.StandardController stdcontroller) {
     this.acct = (Account)stdcontroller.getRecord();
    }
    
    public string getGreeting()
    {
      return 'hello ' + acct.name  +  ' ( ' +acct.id+ ' ) ';
    }

}