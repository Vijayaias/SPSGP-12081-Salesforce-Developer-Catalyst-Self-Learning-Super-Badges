@isTest
public class LeadProcessorTest {
    
    @TestSetup
    static void makeData(){
        List<Lead> theLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            theLeads.add(new Lead(LastName='Lastname'+i, Company='Company'+i));
        }
        insert theLeads;
    }

    @isTest
    public static void test() {
        Test.startTest();
        LeadProcessor lP = new LeadProcessor();
        Id batchId = Database.executeBatch(lP);
        Test.stopTest();

        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
}