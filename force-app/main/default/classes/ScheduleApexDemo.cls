public class ScheduleApexDemo implements Schedulable{
    public void execute(SchedulableContext sc){
        //Any code written inside this method can be schedule
        
      /* List <Account> accs= [Select id,name From Account where CreatedDate= Today];
        for(Account acc: accs){
            acc.name = 'Created today '+acc.Name;
        }
        update accs;*/
        
        // if leave like this in below it will take default as 200
        Database.executeBatch(new TestScheduleBatch());
    } 
        
        
}