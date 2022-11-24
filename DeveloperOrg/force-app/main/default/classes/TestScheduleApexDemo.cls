public class TestScheduleApexDemo implements Schedulable {
    
    public void execute ( SchedulableContext sc)
    {
        // any code written inside this method can be schedule
        // 
        List<Account> accList = [Select Id, Name from Account  Limit 2];
        
        for (Account acc : accList)
        {
            acc.Name = 'Created Today -'+ acc.Name;
        }
        update accList;
    }

}