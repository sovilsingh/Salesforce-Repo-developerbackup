public class contacthandler 
{
    
    public static void insertAccount(list<Contact> conList)
    {
        list<Account> accList = new list<Account>();
        Map<String,Contact> conNameKeys = new Map<String,Contact>();
        for(Contact con : conList)
        {
            Account acc = new Account();
            string contactName = con.FirstName + '' + con.LastName;
            conNameKeys.put(contactName,con);
            acc.Name = contactName;
            accList.add(acc);
        
        }
        insert accList;
        for(Account acc : accList)
        {
        if(conNameKeys.containsKey(acc.Name))
        {
          conNameKeys.get(acc.Name).AccountId = acc.Id;
        }
            
        }
    }
}