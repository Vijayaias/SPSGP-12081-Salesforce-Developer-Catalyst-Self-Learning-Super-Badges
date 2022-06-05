@isTest 
public class TestVerifyDate {
   @isTest static void test1(){
        
    
        Date d=VerifyDate.CheckDates(Date.parse('01/01/2020'),Date.parse('01/03/2020'));
      System.assertEquals(Date.parse('01/03/2020'),d);
     }
   @isTest static void test2(){
        
    
        Date d=VerifyDate.CheckDates(Date.parse('01/01/2020'),Date.parse('03/03/2020'));
      System.assertEquals(Date.parse('01/31/2020'),d);
     }
    
   
}