public class oppProcessor implements Database.Batchable<sObject>, Database.stateful{
    public integer recordCount = 0;
    
    public Database.QueryLocator start ( Database.BatchableContext bc)
    {
        return Database.getQueryLocator([Select Id, Name From Opportunity]);
    }
    
    public void execute(Database.BatchableContext bc, List<Opportunity> opp)
    {
        for(opportunity op : opp)
        {
            op.LeadSource = 'Web';
        }
        
        Update opp;
        recordCount = recordCount + opp.size();
    }
    
    public void finish( Database.BatchableContext bc)
    {
        System.debug('Total Record Processed '+recordCount);
    }
          
}