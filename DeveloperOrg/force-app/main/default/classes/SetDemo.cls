public class SetDemo {
    
    public void setMethod()
    {
        Set<String> listSet = new Set<String>();
        Set<String> listSet2= new Set<String>();
        List<String> strList = new List<String>{'Japan', 'Japan'}; //Duplicate value allowed in LIST
        listSet.add('India');
        listSet.add('USA');
        listSet.add('USA'); // duplicate value not allowes in SET
        listSet.add('UK');
        listSet2.add('UK');
        System.debug('listSet from SET contains => '+listSet);
        System.debug('strList from List Contains =>'+strList);
        listSet.addAll(strList);
        System.debug('listSet from SET contains after adding List =>'+listSet);
    //  listSet.clear();
        System.debug('listSet from SET after clear method =>'+listSet);
      //  listSet2 = listSet.clone();
        System.debug('listSet2 after cloning =>'+listSet2);
        System.debug('Contains India or not listSet2 =>'+listSet2.contains('USA'));
        boolean b ;
        //b = listSet2.containsAll(listSet);
        //b = listSet2.equals(listSet);
        
        if(listSet2.isEmpty())
        {
            System.debug('Empty');
        }
        else
        {
            System.debug('Not Empty');
        }
        listSet.remove('USA');
        System.debug('Print after remove USA '+listSet);
        //listSet.removeAll(listSet2);
        System.debug('Print after remove All '+listSet);
        listSet.retainAll(listSet2);
        System.debug('Print after retain All '+listSet);
        System.debug('Size =>'+listSet.size());
    }
}