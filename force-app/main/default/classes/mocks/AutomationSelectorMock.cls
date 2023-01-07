@IsTest
public inherited sharing class AutomationSelectorMock implements System.StubProvider {
  @TestVisible
  List<SObject> collection;

  public AutomationSelectorMock(List<SObject> collection) {
    this.collection = collection;
  }

  public Object handleMethodCall(
    Object stubbedObject,
    String stubbedMethodName,
    Type returnType,
    List<Type> listOfParamTypes,
    List<String> listOfParamNames,
    List<Object> listOfArgs
  ) {
    return this.collection;
  }
}
