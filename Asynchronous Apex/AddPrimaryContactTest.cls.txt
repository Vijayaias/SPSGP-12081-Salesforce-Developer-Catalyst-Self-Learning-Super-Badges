@isTest
public class AddPrimaryContactTest {
    
    @TestSetup
    static void makeData(){

        List<Account> accountsNY = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accountsNY.add(new Account(Name = 'NY Account'+i, BillingState = 'NY'));
        }
        insert accountsNY;

        List<Account> accountsCA = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            accountsCA.add(new Account(Name = 'CA Account' + i, BillingState = 'CA'));
        }
        insert accountsCA;
    }

    @isTest
    static void testQueueable() {
        Contact caContact = new Contact(LastName = 'CA Contact');
        AddPrimaryContact apc = new AddPrimaryContact(caContact, 'CA');

        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();

        List<Account> CAAccounts = [select Id, (select Id from Contacts) from Account where BillingState = 'CA'];
        Integer countContacts = 0;
        for (Account a: CAAccounts) {
            for (Contact c: a.Contacts) {
                if (c != null) {
                    countContacts = countContacts + 1;
                }
            }
        }

        System.assertEquals(50, countContacts);
    }
}