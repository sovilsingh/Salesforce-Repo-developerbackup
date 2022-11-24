public class OpportunityHandler {
    
    public static void onAFterInsert(List<Opportunity> newList)
    {
        Set<Id> accIds = new Set<Id>();
        List<Account> accTOBEUpdated = new List<Account>();
        
        for(Opportunity opp : newList)
        {
            if(opp.AccountId != null)
            {
                accIds.add(opp.AccountId);
            }
        }
        
        accTOBEUpdated = CalculateAnnualRevenue(accIds);
        
        if(!accTOBEUpdated.isEmpty())
        {
            Update accTOBEUpdated;
        }
    }
    
    public Static void onAfterUpdate (List<Opportunity> newList, Map<Id, Opportunity> oldMap) 
    {
         Set<Id> accIds = new Set<Id>();
        List<Account> accTOBEUpdated = new List<Account>();
        
        for(Opportunity opp : newList)
        {
            if(opp.AccountId != null && opp.Amount != oldMap.get(opp.id).Amount)
            {
                accIds.add(opp.AccountId);
            }
        }
        
        accTOBEUpdated = CalculateAnnualRevenue(accIds);
        
        if(!accTOBEUpdated.isEmpty())
        {
            Update accTOBEUpdated;
        }
        
    }
    
    public static void OnAfterDelete(List<Opportunity> oldList)
    {
        
         Set<Id> accIds = new Set<Id>();
        List<Account> accTOBEUpdated = new List<Account>();
        
        for(Opportunity opp : oldList)
        {
            if(opp.AccountId != null )
            {
                accIds.add(opp.AccountId);
            }
        }
        
        accTOBEUpdated = CalculateAnnualRevenue(accIds);
        
        if(!accTOBEUpdated.isEmpty())
        {
            Update accTOBEUpdated;
        }
        
        
    }
    
    public static List<Account> CalculateAnnualRevenue (Set<Id> accIds)
    {
        List<Account> accTOBEUpdated = new List<Account>();
        Map<id,Decimal> accIdToAnnualRevenue = new Map<Id, Decimal>();
        
        for(Opportunity opp : [Select Id, Amount , AccountId From Opportunity Where AccountID IN : accIds])
        {
            Decimal Total = 0;
            if(accIdToAnnualRevenue.containsKey(opp.AccountId))
            {
                Total = accIdToAnnualRevenue.get(opp.AccountId);
            }
            if(opp.Amount != null )
            {
                Total = Total + opp.Amount;
            }
            
            accIdToAnnualRevenue.put(opp.AccountId, Total );        
        }
        
         if(!accIdToAnnualRevenue.isEmpty())
            {
                for(Id i : accIdToAnnualRevenue.keySet())
                {
                    Account acc = new Account();
                    acc.id = i ;
                    acc.AnnualRevenue = accIdToAnnualRevenue.get(i);
                    accTOBEUpdated.add(acc);                           
                }
                
            }
        
        return accTOBEUpdated;
    }

}