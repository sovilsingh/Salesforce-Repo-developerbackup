public class testBatchschedule implements Database.Batchable<Sobject> {
    
    public Database.QueryLocator Start (Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select Id, Name from Account Limit 2');
    }
    
    public void execute(Database.BatchableContext bc, List<account> accLists)
    {
        for(Account acc : accLists )
        {acc.Name = 'test Schedule Apex - '+acc.Name;}
        update accLists;
    }
     
    public void finish (Database.BatchableContext bc)
    {
        System.debug('Run from Scedule class');
  
    }
}