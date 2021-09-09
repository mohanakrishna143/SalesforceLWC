public with sharing class ContactAuraService {
    public ContactAuraService() { 
    }
    // this is used for wire decorates other is used for impertaive decoraters
    @AuraEnabled(cacheable=true)
    public static List<sObject> getContactList(String name){
        String key='%'+name+'%';
        String Query= 'Select Id, Name, Email, Phone From Contact Where Name LIKE :key';
        return Database.query(Query); 
        // Database.query allows developers to write Query in String format.
        // Runtime it will execute as SOQL Query and return a single sObject or list of sObject type.
        
    }
    @AuraEnabled(cacheable=true)
    public static List<sObject> getAccountList(String name){
        String key='%'+name+'%';
        String Query= 'Select Id, Name, Industry, Phone From Account Where Name LIKE :key';
        return Database.query(Query);
    }
}
