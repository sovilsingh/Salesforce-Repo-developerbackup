@isTest
public class EventUtilityTest {
    @isTest
    private static void TestEventStatuslenght()
    {
        string res = EventUtility.eventPriority('IND');
        System.assertEquals(null, res);
    }
    @isTest
    private static void TestEventStatuslenghtHot()
    {
        string res = EventUtility.eventPriority('CA');
        System.assertEquals('High', res);
    }
    @isTest
    private static void TestEventStatuslenghtMedium()
    {
        string res = EventUtility.eventPriority('NA');
        System.assertEquals('Medium', res);
    }



}