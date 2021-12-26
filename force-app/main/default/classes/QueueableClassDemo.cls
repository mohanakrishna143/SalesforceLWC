public class QueueableClassDemo implements Queueable{
    public void execute(QueueableContext qc){
        //Write any logic asynchronously
       List<Account> accListFromStartMethod = [SELECT Id from Account];
            for(Account acc: accListFromStartMethod){
            acc.Name = 'Quable updated - '+acc.Name;   
        }
        update accListFromStartMethod;
    }

}