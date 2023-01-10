@IsTest
public inherited sharing class AutomationHandlerFactoryMock implements IAutomationHandlerFactory {
  @TestVisible
  private List<IAutomationHandler> handlers;

  public AutomationHandlerFactoryMock(List<IAutomationHandler> handlers) {
    this.handlers = handlers;
  }

  public List<IAutomationHandler> createHandlers() {
    return this.handlers;
  }
}
