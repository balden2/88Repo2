public class OpportunityManager {
    /**
     * Creates a new Opportunity with specified details.
     * @param oppName The name of the Opportunity.
     * @param closeDate The closing date of the Opportunity.
     * @param stageName The stage of the Opportunity.
     * @return The newly created Opportunity.
     * @throws IllegalArgumentException If any parameters are invalid.
     */
    public static Opportunity createOpportunity(String oppName, Date closeDate, String stageName) {
        // Validate input parameters
        if (String.isBlank(oppName)) {
            throw new IllegalArgumentException('Opportunity name cannot be empty.');
        }
        if (closeDate == null) {
            throw new IllegalArgumentException('Close date cannot be null.');
        }
        if (String.isBlank(stageName)) {
            throw new IllegalArgumentException('Stage name cannot be empty.');
        }

        // Create a new Opportunity record
        Opportunity newOpportunity = new Opportunity();
        newOpportunity.Name = oppName;
        newOpportunity.CloseDate = closeDate;
        newOpportunity.StageName = stageName;

        // Insert the new Opportunity into the database
        try {
            insert newOpportunity;
        } catch (DmlException e) {
            // Log the error and rethrow an exception
            System.debug('Error creating Opportunity: ' + e.getMessage());
            throw new IllegalArgumentException('Failed to create Opportunity: ' + e.getMessage());
        }

        // Return the newly created Opportunity
        return newOpportunity;
    }
}