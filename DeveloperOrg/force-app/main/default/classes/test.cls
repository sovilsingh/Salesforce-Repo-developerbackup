public class test  {
    
    public class Wrapper {
    
     public List<Account> accList {get; Set;}
     public List<Contact> conList {get; Set;}

}
    
    
    public static Wrapper methodtoReturn()
    {
        Wrapper wap = new Wrapper();
        wap.accList = [Select ID, name From Account Limit 1];
        wap.conList = [Select ID, name From Contact Limit 1];
        return wap;
    }
    
}