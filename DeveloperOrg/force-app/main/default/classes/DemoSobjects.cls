public class DemoSobjects {
    
    public void demoMethod()
    {
        //Standard Object call
        Account acc = new Account();
        acc.Name = 'Babu Rao ganpat rao apte';
        acc.Phone = '123466789';
        System.debug('acc Print =>'+acc);
        
        
        // Custom object call
        Student__C std = new Student__c();
        std.Name = 'Test';
        std.Fees_Paid__c = 'Yes' ;
        System.debug('std Print =>'+std);
        
        // Generic object call
        Sobject obj;
        obj = new Account( Name = 'Tes', Phone = '1234567897');
        Account accgeneric = (Account)obj;
        System.debug('accgeneric Print =>'+accgeneric);
        obj = new Student__C( Name = 'Student test');
        Student__C stdgeneric = (Student__C)obj;
        System.debug('stdgeneric Print =>'+stdgeneric);
        
        //Using in Loop  
        List<Account> accc = new List<Account>();
     //   accc = [Select Id, Name from Account Limit 2];
       // System.debug('first before loop'+accc);
        
        Set<Id> accids = new Set<Id>();
        Map<Id, Account > mapLists = new Map<Id, Account>( [Select Id, Name From account Limit 2]);
        //Using List Loop first option using Is EMpty method and if else with for loop
     //   if(!accc.isEmpty())
     //   {
           // for(Account accloop : accc) // Use of SOQL
        for(Account accloop : [Select Id, Name from Account Limit 2])
        {
            accids.add(accloop.Id);    
        }
        
        if(! accids.isEmpty())
        {
            //for( id i : accids)
            for ( id i : mapLists.keySet())
            {
                if(mapLists.containsKey(i))
                {
                    System.debug('map Value =>'+mapLists.get(i));
                }
               // System.debug('i =>'+i); 
            }
        }
            //System.debug('accids =>'+accids);   
        //}
       // else
        //{
        //    System.debug('list is empty =>');  
        //} 
    }
}