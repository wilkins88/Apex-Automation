@IsTest
public inherited sharing class AutomationHandlerMock implements IAutomationHandler {
  @TestVisible
  private Boolean isExecuted;
  @TestVisible
  Exception exceptionToThrow;

  public AutomationHandlerMock(Exception e) {
    this.exceptionToThrow = e;
  }

  public AutomationHandlerMock() {
  }

  public void execute() {
    if (this.exceptionToThrow != null) {
      throw this.exceptionToThrow;
    }
    this.isExecuted = true;
  }
}
