public class TestDemoQueueable implements Queueable {

    private Contact con;
    Private String industryValue;
    
    public TestDemoQueueable(Contact con, string industryValue )
    {
        this.con = con;
        this.industryValue = industryValue;
    }
    
    
    public void execute(QueueableContext context )
    {
        
        List<Account> accList = [ Select Id, Name from Account where Industry =:industryValue Limit 100 ];
        
        List <Contact> conList = new List<Contact>();
        for ( Account acc : accList)
        {
            Contact c = con.clone(false, false, false, false);
            c.AccountId = acc.Id;
            conList.add(c);
        }
        
        if(!conList.isEmpty())
        {
            insert conList;
        }
        
        //Contact Con = new Contact(LastName = 'QueueableApex');
//TestDemoQueueable conClone = new TestDemoQueueable(con, 'Media');
//id jobid = System.enqueueJob(conClone);
        
    }
}