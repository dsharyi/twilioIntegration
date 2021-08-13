@isTest
public with sharing class TestLoggerService {
    @testSetup 
    static void setup() {
        TwilioConfiguration__c twilioConfig = new TwilioConfiguration__c();
        twilioConfig.Name = UtilConstantsForTest.TWILIO_CS_NAME;
        twilioConfig.Account_sId__c = UtilConstantsForTest.TWILIO_ACCOUNT_SID;
        twilioConfig.Auth_Token__c = UtilConstantsForTest.TWILIO_AUTH_TOKEN;
        twilioConfig.MobileNumberFrom__c = UtilConstantsForTest.TWILIO_MOBILE_NUMBER_FROM;
        twilioConfig.SMS_Body__c = UtilConstantsForTest.TWILIO_SMS_BODY;
        twilioConfig.TwilioEndpoint__c = UtilConstantsForTest.TWILIO_ENDPOINT;
        twilioConfig.TwilioTypeOfOperation__c = UtilConstantsForTest.TWILIO_TYPE_OF_OPERATION;
        insert twilioConfig;

    }

    @isTest
	static void testCreateLogNegativeCase() {
        LoggerServiceDTO testDTO = new LoggerServiceDTO(UtilConstantsForTest.DTO_TEST_ORIGIN, UtilConstantsForTest.DTO_ERROR_BODY);
        
        LoggerService.createLog(testDTO);

        Custom_Logger__c testLog = [SELECT Id, Origin__c, Error_Body__c
                                    FROM Custom_Logger__c];

        System.assertNotEquals(null, testLog.Origin__c);
        System.assertNotEquals(null, testLog.Error_Body__c);
        
    }

    @isTest
	static void testCreateLogPositiveCase() {
        LoggerServiceDTO testDTO = new LoggerServiceDTO(UtilConstantsForTest.DTO_TEST_ORIGIN, UtilConstantsForTest.DTO_ERROR_BODY);
    
        LoggerService.createLog(testDTO);

        Custom_Logger__c testLog = [SELECT Id, Origin__c, Error_Body__c
                                    FROM Custom_Logger__c];

        System.assertEquals(testDTO.origin, testLog.Origin__c);
        System.assertEquals(testDTO.errorBody, testLog.Error_Body__c);
        
    }
}