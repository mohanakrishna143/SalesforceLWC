public class TestDemoContactBatch implements Database.Batchable<SObject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        // 1 MILLION == 2000 records to execute
        return Database.getQueryLocator('SELECT Id,lastName from Contact'); 
        // It will not hit execetion
        //it will get all 1L account records
    }
    public void execute(Database.BatchableContext bc, List<Contact> subListFromStartMethod){
        //Logic to process all 2000 records.
        for(Contact con: subListFromStartMethod){
            con.lastName = 'Batch updated - '+con.lastName; 
        }
        update subListFromStartMethod;
    }
    public void finish(Database.BatchableContext bc){
		//Post process logic
		System.debug('@@ Contact Batch job Completed');        
    }
}