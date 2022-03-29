public with sharing class opportunitySumary {
    @AuraEnabled
    public static List<Opportunity> getOpportunity() {  
        return [SELECT Id, Name FROM Opportunity];
    }     
}
