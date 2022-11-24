public class CL_04July2022_GetAccountAllSearchText {
    
    @AuraEnabled
    public static List<Account> getAccount(string searchtxt)
    {
        
        string query= 'Select ID, Name, Phone, Industry, Rating From Account Where Name like\'%'+searchtxt+'%\'';
        
        List<Account> accounts = Database.query(query);
        
        return accounts;
    }
}