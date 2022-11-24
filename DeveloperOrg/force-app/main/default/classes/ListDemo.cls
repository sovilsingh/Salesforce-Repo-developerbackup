public class ListDemo {
    
    public void listMethod ()
    {
        
        List<String> strList = new List<String>();
        List<String> strList2 = new List<String>();
        List<string> strList3 = new list<String>();
        sObject sobj = [Select id, Name from Account Limit 1];
        Set<String> strSet = new Set<String>();
        strList.add('INDIA');
        strList.add('USA');
        strList.add('UK');
        strList.add('CHINA');
        System.debug('List Country added name ='+ strList);
        strList.add(2, 'Russia');
        System.debug('List Country added name ='+ strList);
        strList2.add('Pakistan');
        strList2.add('Sri Lanka');
        strList2.addAll(strList);
        strSet.add('Japan');
        System.debug(strList);
        System.debug(strList2);
        strList2.addAll(strSet);
        System.debug(strList2);
        strList3 = strList2.clone();
        strList2.clear();
        System.debug(strList2);
        System.debug(strList3);
        Boolean res;
        res = strList3.contains('INDIA');
        System.debug('response on contain India or not = '+res);
        System.debug('Get Method second place for strList3 ='+strList3.get(2));
        System.debug('Object Type of sObject =>'+sobj.getSObjectType());
        System.debug('Object Type of sObject =>'+sobj.getSObjectType());
        System.debug('Index of INDIA = '+ strList3.indexOf('USA'));
        System.debug('isEmpty or not srList3 = '+strList3.isEmpty());
        System.debug('Size srList3 = '+strList3.size());
        strList3.sort();
        System.debug(strList3);
        List<Account> listAcc = new List<account>();
        listAcc = [select id, Name from Account Limit 3];
        System.debug(listAcc);
        
        
        
    }

}