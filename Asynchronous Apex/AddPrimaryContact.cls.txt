public class AddPrimaryContact implements Queueable {
    
    private Contact myContact;
    private String state;
    
    public AddPrimaryContact(Contact myContact, String state) {
        this.myContact = myContact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id, Name from Account WHERE BillingState = :state LIMIT 200];

        List<Contact> contactsToAdd = new List<Contact>();

        for (Account a: accounts) {
            Contact c = myContact.clone();
            c.AccountId = a.Id;
            contactsToAdd.add(c);
        }

        insert contactsToAdd;
    }

}