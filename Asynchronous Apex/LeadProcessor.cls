public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource from Lead');
    }

    public void execute(Database.BatchableContext bc, List<Lead> leads) {
        for (Lead l: leads) {
            l.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        update leads;
    }

    public void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed.');
    }
}