public class TestScheduleBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        // 1 MILLION == 2000 records to execute
        return Database.getQueryLocator('SELECT Id,Name,Description from Account'); 
        // It will not hit execetion
        //it will get all 1L account records
    }
    public void execute(Database.BatchableContext bc, List<Account> subListFromStartMethod){
        //Logic to process all 2000 records.
        for(Account acc: subListFromStartMethod){
            //acc.Name = 'Batch updated - '+acc.Name; 
            acc.Name = 'I updated the Batch name updated';
            acc.Description = 'Batch Job Description -'+acc.Description;
        }
        update subListFromStartMethod;
    }
    public void finish(Database.BatchableContext bc){
        //Post process logic
        System.debug('@@ Batch job Completed');  
        Database.executeBatch(new TestDemoContactBatch(),25);
    }
}