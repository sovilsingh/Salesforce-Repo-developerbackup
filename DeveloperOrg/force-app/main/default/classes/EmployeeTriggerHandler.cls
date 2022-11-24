public class EmployeeTriggerHandler {
    
    public static void CheckEmployeeStatus ( List<Employee__c> oldList)
    {
        for(Employee__c emp : oldList)
        {
            if(emp.Active__c == True)
            {
                emp.addError('Active Employee cannot be removed');
            }
        }  
    }
    
    public static void UpdateLeftEmployeeCountOnAcc(List<Employee__c> oldList )
    {
        Set<id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        Map<id,Account> accIdToAccMap;
        List<Employee__c> empList = new List<Employee__C>();
        Map<Id,Decimal> accIdToTotalCount = new Map<Id,Decimal>();
        
        for ( Employee__C emp : oldList)
        {
            if(emp.Account__c != null)
            {
                accIds.add(emp.Account__c);
                empList.add(emp);
            }
        }
        
        if(!accIds.isEmpty())
        {
            accIdToAccMap = new Map<id, Account> ([ Select Id, Left_Employee_Count__c From Account Where ID In: accIds]);
        }
        
        if(!empList.isEmpty())
           {
               for(Employee__c emp : empList)
               {
                   if(accIdToAccMap.containsKey(emp.Account__c))
                   {
                        if(accIdToTotalCount.containsKey(emp.Account__c))
                   {
                       Decimal count = accIdToTotalCount.get(emp.Account__c) + 1 ;
                       accIdToTotalCount.put(emp.Account__c, count);
                   }
                   else
                   {
                       accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c + 1 );
                   }
                   }
               }       
           }
        
        for (Id accid : accIdToTotalCount.keySet())
        {
            Account acc = new Account();
            acc.id = accid;
            acc.Left_Employee_Count__c = accIdToTotalCount.get(accid);
            accToBeUpdated.add(acc);
        }
        
        if(!accToBeUpdated.isEmpty())
        {
            update accToBeUpdated;
        }
        
        //List<Employee__c> empList = [ Select Id from Employee__c where Account__C = '0015g00000jR2rzAAC' ];
//System.debug(empList);
//Delete empList;

    }
    
    public static void UndeleteEmployees(List<Employee__c> newList)
    {
        Set<id> accIds = new Set<Id>();
        List<Account> accToBeUpdated = new List<Account>();
        List<Employee__c> empList = new List<Employee__C>();
        List<Employee__C> empToBeUpdated = new List<Employee__c>();
        Map<Id,Decimal> accIdToTotalCount = new Map<Id,Decimal>();
        Map<id,Account> accIdToAccMap;
        for(Employee__c emp : newList)
        {
            Employee__c e = new Employee__c();
            e.Id = emp.id;
            e.Active__c = true;
            empToBeUpdated.add(e);
            if(emp.Account__c != null)
            {
                accIds.add(emp.Account__c);
                empList.add(emp);
            }
        }
        
        if(!accIds.isEmpty())
        {
            accIdToAccMap = new Map<id, Account> ([ Select Id, Left_Employee_Count__c From Account Where ID In: accIds]);
        }
        
        if(!empList.isEmpty())
           {
               for(Employee__c emp : empList)
               {
                   if(accIdToAccMap.containsKey(emp.Account__c))
                   {
                        if(accIdToTotalCount.containsKey(emp.Account__c))
                   {
                       Decimal count = accIdToTotalCount.get(emp.Account__c) - 1 ;
                       accIdToTotalCount.put(emp.Account__c, count);
                   }
                   else
                   {
                       accIdToTotalCount.put(emp.Account__c,accIdToAccMap.get(emp.Account__c).Left_Employee_Count__c - 1);
                   }
                   }
               }       
           }
        
        for (Id accid : accIdToTotalCount.keySet())
        {
            Account acc = new Account();
            acc.id = accid;
            acc.Left_Employee_Count__c = accIdToTotalCount.get(accid);
            accToBeUpdated.add(acc);
        }
        
        if(!accToBeUpdated.isEmpty())
        {
            update accToBeUpdated;
        }
        
        
        if(!empToBeUpdated.isEmpty())
        {
            update empToBeUpdated;
        }
    }
}