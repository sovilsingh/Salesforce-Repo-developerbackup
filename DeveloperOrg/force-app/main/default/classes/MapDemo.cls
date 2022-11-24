public class MapDemo {

    public void MapMethod()
    {
        
        Map<Integer, String> intToStringMap = new Map<Integer, String>();
        Map<Integer, String> intToStringMap2 = new Map<Integer, String>();
        intToStringMap.put(1, 'A');
        intToStringMap.put(2, 'B');
        System.debug('intToStringMap List =>'+intToStringMap);
        intToStringMap.put(2, 'C');
        System.debug('intToStringMap List =>'+intToStringMap);
        intToStringMap.remove(2);
        System.debug('intToStringMap List =>'+intToStringMap);
        System.debug('intToStringMap List Size =>'+intToStringMap.size());
        System.debug('intToStringMap List Size =>'+intToStringMap.values());
        Set<Integer> intSet = new Set<Integer>();
        intSet = intToStringMap.keySet();
        System.debug('intToStringMap List Size =>'+intSet);
        intToStringMap2 = intToStringMap.clone();
        System.debug('intToStringMap2 List Size =>'+intToStringMap2);
        System.debug('intToStringMap2 List Size =>'+intToStringMap2.containsKey(2));
        System.debug('intToStringMap2 List Size =>'+intToStringMap2.get(1));
        System.debug('intToStringMap2 List Size =>'+intToStringMap2.isEmpty());
        Map<Id, Account> accIdMap = new Map<Id, Account>([select Id, Name From Account Limit 2]);
        System.debug('accIdMap call'+accIdMap);
    }
}