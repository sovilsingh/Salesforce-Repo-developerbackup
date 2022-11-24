public with sharing class CL_17AUG2022_GetContactWireRecords 
{
    @AuraEnabled(cacheable=true)
   public static List<Contact> GetContactList()
   {
       return [Select Id, FirstName, LastName, Phone, Email from Contact];
   }
}