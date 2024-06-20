@isTest
public class AccountManagerTest {
    // Test method for successful account creation
    @isTest static void testCreateAccountSuccess() {
        String testAccountName = 'Test Account';
        
        // Call the method under test
        Test.startTest();
        Account result = AccountManager.createAccount(testAccountName);
        Test.stopTest();
        
        // Assert that the account was created with the correct name
        System.assertNotEquals(null, result.Id, 'Account should be created with an ID');
        System.assertEquals(testAccountName, result.Name, 'Account name should match the input name');
    }

    // Test method for handling null account name
    @isTest static void testCreateAccountWithEmptyName() {
        String testAccountName = '';
        
        // Expected exception due to empty account name
        Boolean caught = false;
        try {
            Account result = AccountManager.createAccount(testAccountName);
        } catch (IllegalArgumentException e) {
            caught = true;
            System.assertEquals('Account name cannot be empty.', e.getMessage(), 'Exception message should match expected error');
        }
        
        // Assert that an exception was thrown
        System.assert(caught, 'An IllegalArgumentException should be thrown for empty account name');
    }
}