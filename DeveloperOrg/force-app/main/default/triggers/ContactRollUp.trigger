trigger ContactRollUp on Contact (after insert, after update, after delete) 
{
   /* if(trigger.isInsert || trigger.isUpdate)
    {
        ContactPriceHandler.SumPrice(trigger.New);
    }
    
    if(trigger.isDelete)
    {
        System.debug('Reached');
        ContactPriceHandler.SumPrice(trigger.Old);
    }
*/
}