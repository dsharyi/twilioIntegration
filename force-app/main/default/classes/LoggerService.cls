public with sharing class LoggerService {

    public static void createLog (LoggerServiceDTO dto) {
        Custom_Logger__c customLog = new Custom_Logger__c (
            Origin__c = dto.origin,
            Error_Body__c = dto.errorBody);
    
        insert customLog;
    }
}