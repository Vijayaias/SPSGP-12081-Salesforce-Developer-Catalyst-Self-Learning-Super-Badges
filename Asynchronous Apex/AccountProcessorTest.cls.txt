@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void testCountcontacts() {
        Account newAccount = new Account(Name = 'Test Account 1');
        insert newAccount;
        Contact contact1 = new Contact(Lastname = 'ContactAccount1', AccountId = newAccount.Id);
        insert contact1;
        Contact contact2 = new Contact(Lastname = 'ContactAccount2', AccountId = newAccount.Id);
        insert contact2;
        System.debug(newAccount);
        System.debug(contact1);
        System.debug(contact2);

        Account newAccount2 = new Account(Name = 'Test Account 2');
        insert newAccount2;
        Contact contact3 = new Contact(Lastname = 'ContactAccount3', AccountId = newAccount2.Id);
        insert contact3;
        List<Id> accountIds = new List<Id>();
        accountIds.add(newAccount.Id);
        accountIds.add(newAccount2.Id);

        System.debug(accountIds);

        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        List<Account> accountsUpdated = [SELECT Id, Name, Number_of_Contacts__c, (SELECT Id, Name from Contacts) from Account WHERE Id in :accountIds];
        
        System.debug(accountsUpdated);

        System.assertEquals(accountsUpdated.get(0).Number_of_Contacts__c, 2);
        System.assertEquals(accountsUpdated.get(1).Number_of_Contacts__c, 1);

    }
}