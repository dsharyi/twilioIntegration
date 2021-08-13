public with sharing class AccountTriggerHandler {
    public static final String GOLD_ACCOUNT = 'GOLD';
 
    public static void beforeUpdate(List<Account> newAccounts, Map<Id, Account> oldAccountsMap) {
        Set <String> accountsPhonesForSendingSMS = new Set<String>();
        for (Account newAccount : newAccounts) {
            if (isAccountMustRetrieveSMS(oldAccountsMap.get(newAccount.Id), newAccount)) {
                accountsPhonesForSendingSMS.add(newAccount.Phone);
            }
        }
        if (!accountsPhonesForSendingSMS.isEmpty()) {
            TwilioService.sendSMSToGoldAccounts(accountsPhonesForSendingSMS);
        }
    }

    @TestVisible
    private static Boolean isAccountMustRetrieveSMS(Account oldAccount, Account newAccount) {
        return oldAccount.Loyalty_programme__c != GOLD_ACCOUNT && newAccount.Loyalty_programme__c == GOLD_ACCOUNT && String.isNotBlank(newAccount.Phone);
    }
}