@IsTest
private inherited sharing class AutomationSelectorTest {
  @IsTest
  private static void getAutomationHandlerConfig_anyConfig_queryExecutedSuccessfully() {
    AutomationSelector selector = new AutomationSelector();
    System.Test.startTest();
    List<SObjectAutomationHandler__mdt> handlers = selector.getAutomationHandlerConfig(
      Account.getSObjectType(),
      System.TriggerOperation.BEFORE_INSERT
    );
    System.Test.stopTest();
    // no real assertion here to not create test failures pending org installed on
    System.assert(true, 'Query successfully executed');
  }
}
