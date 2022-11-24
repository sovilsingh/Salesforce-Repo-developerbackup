public class LeadDemoHandler {

    
   public Static void LeadStatusError(List<Lead> acclead)
   {

        for(Lead ldloop : acclead)
        {
            
            if(ldloop.Status == 'Closed - Converted')
            {
                ldloop.addError('Lead cannot be created in "Closed - Converted" status. Please select other status');
            }
            
            
        }
       
   }
}