trigger LeadDemo on Lead (before insert) {

    
    //We are having the requirement to write a trigger on the lead object to prevent 
    //the creation of lead in “Closed - Converted” status. 
    //We will be writing a trigger to achieve this requirement.
    if(trigger.isInsert)
    {
        
        LeadDemoHandler.LeadStatusError(trigger.new);
    }
    
}