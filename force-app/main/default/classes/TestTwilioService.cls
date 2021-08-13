@isTest 
public with sharing class TestTwilioService {
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
	static void testSendSMSToGoldAccountsNegativeCase() {
        NegativeTwilioHttpCalloutMock mock = new NegativeTwilioHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        Set <String> mobileNumbersOfAppropriateGoldAccounts = new Set<String>{UtilConstantsForTest.MOBILE_PHONE_ACCOUNT};

        Test.startTest();
        TwilioService.sendSMSToGoldAccounts(mobileNumbersOfAppropriateGoldAccounts);
        Test.stopTest();

        System.assertEquals(1, mock.testCalls);
        
    }

    @isTest 
	static void testSendSMSToGoldAccountsPositiveCase() {
        TwilioHttpCalloutMock mock = new TwilioHttpCalloutMock();
        Test.setMock(HttpCalloutMock.class, mock);
        Set <String> mobileNumbersOfAppropriateGoldAccounts = new Set<String>{UtilConstantsForTest.MOBILE_PHONE_ACCOUNT};

        Test.startTest();
        TwilioService.sendSMSToGoldAccounts(mobileNumbersOfAppropriateGoldAccounts);
        Test.stopTest();
        
        System.assertEquals(1, mock.testCalls);
        
    }
}