trigger LeadSMS on Lead (after insert) 
{
    
    Map<id, Lead> leadmap = trigger.newMap;
    Set<id> keys = leadmap.keySet();
    
    CL_INT_RT_LEADtoSMS.SendMessage(keys);
}