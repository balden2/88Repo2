@isTest
public class OpportunityManagerTest {
    // Test method to verify successful Opportunity creation
    @isTest static void testCreateOpportunitySuccess() {
        String oppName = 'Test Opportunity';
        Date closeDate = Date.today().addDays(30);
        String stageName = 'Prospecting';

        Test.startTest();
        Opportunity createdOpp = OpportunityManager.createOpportunity(oppName, closeDate, stageName);
        Test.stopTest();

        // Assert that the Opportunity was created with the correct details
        System.assertNotEquals(null, createdOpp.Id, 'The Opportunity should have an ID.');
        System.assertEquals(oppName, createdOpp.Name, 'The Opportunity name should match.');
        System.assertEquals(closeDate, createdOpp.CloseDate, 'The Opportunity close date should match.');
        System.assertEquals(stageName, createdOpp.StageName, 'The Opportunity stage name should match.');
    }

    // Test method to verify handling of empty Opportunity name
    @isTest static void testCreateOpportunityEmptyName() {
        String oppName = '';
        Date closeDate = Date.today().addDays(30);
        String stageName = 'Prospecting';

        Boolean isExceptionThrown = false;
        try {
            Opportunity createdOpp = OpportunityManager.createOpportunity(oppName, closeDate, stageName);
        } catch (IllegalArgumentException e) {
            isExceptionThrown = true;
            System.assertEquals('Opportunity name cannot be empty.', e.getMessage(), 'Exception message should match expected error.');
        }

        // Assert that an exception was thrown
        System.assert(isExceptionThrown, 'An IllegalArgumentException should be thrown for an empty Opportunity name.');
    }

    // Test method to verify handling of null close date
    @isTest static void testCreateOpportunityNullCloseDate() {
        String oppName = 'Test Opportunity';
        Date closeDate = null;
        String stageName = 'Prospecting';

        Boolean isExceptionThrown = false;
        try {
            Opportunity createdOpp = OpportunityManager.createOpportunity(oppName, closeDate, stageName);
        } catch (IllegalArgumentException e) {
            isExceptionThrown = true;
            System.assertEquals('Close date cannot be null.', e.getMessage(), 'Exception message should match expected error.');
        }

        // Assert that an exception was thrown
        System.assert(isExceptionThrown, 'An IllegalArgumentException should be thrown for a null close date.');
    }

    // Test method to verify handling of empty stage name
    @isTest static void testCreateOpportunityEmptyStageName() {
        String oppName = 'Test Opportunity';
        Date closeDate = Date.today().addDays(30);
        String stageName = '';

        Boolean isExceptionThrown = false;
        try {
            Opportunity createdOpp = OpportunityManager.createOpportunity(oppName, closeDate, stageName);
        } catch (IllegalArgumentException e) {
            isExceptionThrown = true;
            System.assertEquals('Stage name cannot be empty.', e.getMessage(), 'Exception message should match expected error.');
        }

        // Assert that an exception was thrown
        System.assert(isExceptionThrown, 'An IllegalArgumentException should be thrown for an empty stage name.');
    }
}