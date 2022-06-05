public class AccountProcessor {
	
    @future
    public static void countContacts(List<Id> accountIds) {
        
        List<Account> accounts = [SELECT Id, Name, Number_of_Contacts__c, (SELECT Id, Name from Contacts) from Account WHERE Id in :accountIds];

        for (Account a: accounts) {
            a.Number_of_Contacts__c = a.Contacts.size();
        }

        update accounts;
    }
}