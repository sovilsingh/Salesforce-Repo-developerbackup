@isTest
public class CL_INT_TESTMAIN 
{
         @isTest
         public static void testmain()
         {
             CL_INT_FAKERESTMAIN data = new CL_INT_FAKERESTMAIN();
             System.Test.setMock(HttpCalloutMock.class, data);
            
             
             CL_INT_RESTMAIN req = new CL_INT_RESTMAIN();
             req.Invoke();
             
             Account acc = [Select Id, Name from Account];
             System.assertEquals('Test Karlo', acc.Name);
         }
}