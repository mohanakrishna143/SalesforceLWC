public with sharing class PageList {
    public PageList() { 
    } 
    @AuraEnabled(cacheable=true)
    public static List<Account> getListOfAccounts(){
       return [select Id,Name,AccountNumber,Phone,Industry from Account];
    }
}
