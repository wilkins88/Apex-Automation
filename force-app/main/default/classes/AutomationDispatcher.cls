/**
 * @description Dispatcher that gathers automation handlers and executes them in order
 * Also serves as a centralized layer for feature to be added, such as error handling, logging
 * etc.
 *
 * @group Automation
 */
public inherited sharing class AutomationDispatcher {
  @TestVisible
  private IAutomationHandlerFactory factory;
  @TestVisible
  private AutomationContext ctx {
    get {
      if (this.ctx == null) {
        this.ctx = AutomationContext.getInstance();
      }
      return this.ctx;
    }
    set;
  }

  /**
   * @description Constructor
   * @param factory {@link IAutomationHandlerFactory} for producing handlers
   */
  public AutomationDispatcher(IAutomationHandlerFactory factory) {
    this.factory = factory;
  }

  /**
   * @description Loads and executes automation handlers
   */
  public void dispatch() {
    try {
      for (IAutomationHandler handler : this.factory.createHandlers()) {
        handler.execute();
      }
    } catch (Exception e) {
      // capture and move to add error to provide
      // a more graceful failure for OOTB UI featuress
      for (SObject record : this.ctx.getPrimaryTriggerArray()) {
        this.ctx.addError(record, e.getMessage());
      }
    }
  }
}
