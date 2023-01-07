@IsTest
private inherited sharing class AutomationDispatcherTest {
  @IsTest
  private static void dispatch_noErrors_executeHandler() {
    AutomationHandlerMock handlerMock = new AutomationHandlerMock();
    AutomationHandlerFactoryMock factoryMock = new AutomationHandlerFactoryMock(
      new List<IAutomationHandler>{ handlerMock }
    );
    AutomationDispatcher dispatcher = new AutomationDispatcher(factoryMock);
    dispatcher.ctx = new AutomationContextMock(
      null,
      new List<SObject>(),
      new List<SObject>()
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();
    System.assertEquals(
      true,
      handlerMock.isExecuted,
      'Should execute the handler'
    );
  }

  @IsTest
  private static void dispatch_withErrors_throwException() {
    AutomationHandlerMock handlerMock = new AutomationHandlerMock(
      new DMLException('TEST MESSAGE')
    );
    AutomationHandlerFactoryMock factoryMock = new AutomationHandlerFactoryMock(
      new List<IAutomationHandler>{ handlerMock }
    );
    AutomationDispatcher dispatcher = new AutomationDispatcher(factoryMock);
    dispatcher.ctx = new AutomationContextMock(
      System.TriggerOperation.BEFORE_INSERT,
      new List<SObject>{ new Account() },
      new List<SObject>()
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();
    System.assertEquals(
      'TEST MESSAGE',
      ((AutomationContextMock) dispatcher.ctx).errorMessage,
      'Should catch the exception and invoke addError'
    );
  }
}
