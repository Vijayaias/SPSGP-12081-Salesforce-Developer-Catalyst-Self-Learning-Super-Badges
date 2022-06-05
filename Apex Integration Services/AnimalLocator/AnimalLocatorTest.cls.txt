@isTest
public class AnimalLocatorTest {
    
    @isTest
    static void animalLoacatorTest1(){
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        String actual=AnimalLocator.getAnimalNameById(1);
        String expected='moose';
        System.assertEquals(actual,expected);
    }
}