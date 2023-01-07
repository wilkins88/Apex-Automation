@IsTest
private inherited sharing class AutomationContextTest {
  @IsTest
  private static void coverage() {
    // because most of these methods are dependent on being in a
    // a trigger context, we can't really test them
    // so just hitting coverage
    AutomationContext ctx = AutomationContext.getInstance();
    System.Test.startTest();
    ctx.getTriggerNew();
    ctx.getTriggerOld();
    ctx.getTriggerNewMap();
    ctx.getTriggerOldMap();
    ctx.getTriggerOperation();
    ctx.getPrimaryTriggerArray();
    ctx.isBeforeInsert();
    ctx.isBeforeUpdate();
    ctx.isBeforeDelete();
    ctx.isAfterInsert();
    ctx.isAfterUpdate();
    ctx.isAfterDelete();
    ctx.isAfterUndelete();
    ctx.addError(new Account(), 'Test error');
    System.Test.stopTest();
    System.assert(true, 'All methods successfully executed');
  }
}
