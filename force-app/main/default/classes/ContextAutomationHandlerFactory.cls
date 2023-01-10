/**
 * @description Creates automation handlers based on the SObject for which the automation is executing and the
 * context for which the automation is executing in. Refer to {@link IAutomationHandlerFactory} for more details
 *
 * @group Automation
 */
public inherited sharing class ContextAutomationHandlerFactory implements IAutomationHandlerFactory {
  @TestVisible
  private static final String APEX_STRING = 'Apex';
  @TestVisible
  private static final String FLOW_STRING = 'Flow';

  @TestVisible
  private AutomationSelector selector {
    get {
      if (this.selector == null) {
        this.selector = new AutomationSelector();
      }
      return this.selector;
    }
    set;
  }
  @TestVisible
  private Schema.SObjectType sObjType;
  @TestVisible
  private System.TriggerOperation op;

  /**
   * @description Constructor
   * @param sObjType [Schema.SObjectType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectType.htm) to load automation for
   */
  public ContextAutomationHandlerFactory(
    Schema.SObjectType sObjType,
    System.TriggerOperation op
  ) {
    this.sObjType = sObjType;
    this.op = this.op;
  }

  /**
   * @description Creates and returns the handlers to be used based on injected sobject type and
   * automation context
   * @see IAutomationHandlerFactory
   * @return List of {@link IAutomationHandler} instances to execute
   */
  public List<IAutomationHandler> createHandlers() {
    List<IAutomationHandler> handlers = new List<IAutomationHandler>();
    List<SObjectAutomationHandler__mdt> activeHandlers = this.selector.getAutomationHandlerConfig(
      this.sObjType,
      this.op
    );
    for (SObjectAutomationHandler__mdt config : activeHandlers) {
      if (config.AutomationType__c == APEX_STRING) {
        handlers.add(
          (IAutomationHandler) Type.forName(config.ApiName__c).newInstance()
        );
      } else if (config.AutomationType__c == FLOW_STRING) {
        handlers.add(new FlowAutomationHandler(config.ApiName__c));
      }
    }
    return handlers;
  }
}
