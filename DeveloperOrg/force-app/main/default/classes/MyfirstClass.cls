public class MyfirstClass {
    
   // public MyfirstClass()
   // {
    //    System.debug('I am MyfirstClass');
   // }
   // 
    //Boolean b;
    public void methodDemo()
    {
        //b = true;
        //System.debug('this is new Method');
        //System.debug('b ='+b);
        
        // Type 1 - Casting Generic sObject to Specific sObject
       // Sobject obj = new Account( Name = 'Test');
       // Account acc = (Account)obj;
       // obj = new Contact();
       // Contact con = (Contact)obj;
       // con.LastName = 'Papa Kasam';
       // con.Email = 'xyz@gmail.com';
      //  con.Phone = '123456789';
        
        // Collection : List, Map, SET
        // List   
        List<string> strList = new List<string>();
        strList.add('A');
        strList.add('B');
        strList.add('C');
        strList.add('D');
        System.debug('List Contains ='+strList);
        string gget = strList.get(1); 
        System.debug('After Get Method ='+gget);
        strList.add(2,'E');
        System.debug('After add at 1th place ='+strList);
        //Integer s = strList.size();
        Boolean b = strList.isEmpty();
        System.debug('Empty or not ='+b);
        strList.clear();
        System.debug('List Contains ='+strList);
        Boolean a = strList.isEmpty();
        System.debug('Empty or not ='+a);
        //SOQL
        List<Account> accList = [select id, Name FROM Account Limit 2];
        System.debug('Account List  ='+accList);
        
        //SET
        System.debug('SET');
        Set<Integer> intSet = new Set<Integer>();
        intSet.add(10);
        intSet.add(20);
        System.debug('List  ='+intSet);
        intSet.remove(20);        
        System.debug('List  ='+intSet);
        Boolean c = intSet.Contains(10);
        System.debug('List Contain 10  ='+c);
        Integer i = intSet.size();
        System.debug('List Size  ='+i);
        Boolean d = intSet.isEmpty();
        System.debug('List is Empty  ='+d);
        
        //Map
        System.debug('Map');
        
        Map<string, string> demoMap = new Map<string, string>();
        demoMap.put('1', 'First');
        demoMap.put('2', 'Second');
        System.debug('Map ='+demoMap);
        // Type 2 - Standard Object
        //Account acc = new Account();
        // acc.Name = 'Test123';
        //acc.Phone = '123456';
        //Type 3 - Custom Object
        //Student__C std = new Student__C();
        //std.Name = 'Sovil Singh';
        //std.Belonging_Department__c = 'a015g00000aWBczAAG';
        
       // System.debug('Account ='+acc);
       // System.debug('Student ='+std);
        //System.debug('Contact ='+con);
    }
}