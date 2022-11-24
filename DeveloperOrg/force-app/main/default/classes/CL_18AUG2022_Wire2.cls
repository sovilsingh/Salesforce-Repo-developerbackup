public with sharing class CL_18AUG2022_Wire2 {
   
    @AuraEnabled(cacheable=true)
    public static List<contact> findcontacts(string searchText)
    {
        String key = '%'+searchText+'%';
        return [Select id,Name, Phone, Email From contact where firstName like:key];
    }
}