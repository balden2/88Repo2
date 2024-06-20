public class AccountManager {
    // Method to create a new Account
    public static Account createAccount(String accountName) {
        // Ensure the account name is not empty
        if (String.isBlank(accountName)) {
            throw new IllegalArgumentException('Account name cannot be empty.');
        }

        // Create new Account object
        Account newAccount = new Account(Name = accountName);
        
        // Insert the Account record into the database
        insert newAccount;

        // Return the newly created Account
        return newAccount;
    }
}