public class TestDemoBatchable implements Database.Batchable<Sobject> {
    
    public Database.QueryLocator start ( Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select id, Name from Account Limit 1');
    }
    
    Public void execute(Database.BatchableContext bc, List<Account> subListFromStartMethod)
    {
        //Logic to Process all list getting from start 
        
        for(Account accc : subListFromStartMethod )
        {
            accc.name = 'Batch updated- '+accc.name;
        }
        
        update subListFromStartMethod;
    }

    public void finish(Database.BatchableContext bc)
    {
        //post process logic
        System.debug('@@ Batch job Finish');
    }
}