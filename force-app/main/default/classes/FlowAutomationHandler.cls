/**
 * @descriptoin Automation handler for wiring in flows to the automation framework
 * This should be the preferred method over strictly record triggered flows when working
 * in complex environments as they promote testability, governance, control, and maintainability
 *
 * @group Automation
 */
public inherited sharing class FlowAutomationHandler implements IAutomationHandler {
  @TestVisible
  private static final String FLOW_STRING = 'flow';
  @TestVisible
  private static final String RECORD_STRING = 'record';
  @TestVisible
  private static final String PREVIOUS_RECORD_STRING = 'previousRecord';

  @TestVisible
  private String flowName;
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
   * @param flowName API name of the flow that is intended to be executed
   */
  public FlowAutomationHandler(String flowName) {
    this.flowName = flowName;
  }

  /**
   * @descrption Configures and executes the flow injected into the instance
   * @see {@link IAutomationHandler}
   */
  public void execute() {
    List<Map<String, Object>> flowInputs = this.getFlowInputs();
    Invocable.Action action = Invocable.Action.createCustomAction(
      FLOW_STRING,
      this.flowName
    );
    action.setInvocations(flowInputs);
    List<Invocable.Action.Result> results = action.invoke();
    for (Integer i = 0; i < results.size(); i++) {
      if (results[i].isSuccess() == true) {
        this.handleSuccess(results[i], i);
      } else {
        this.handleError(results[i], i);
      }
    }
  }

  /**
   * @description Helper to produce flow inputs for the flow to be set on the
   * action and executed
   * @return List of maps which capture flow inputs for record-related autolaunched flows
   */
  @TestVisible
  private List<Map<String, Object>> getFlowInputs() {
    List<Map<String, Object>> inputs = new List<Map<String, Object>>();
    // updates may care about both new and old
    if (this.ctx.isBeforeUpdate() || this.ctx.isAfterUpdate()) {
      for (SObject record : this.ctx.getTriggerNew()) {
        inputs.add(
          new Map<String, Object>{
            RECORD_STRING => record,
            PREVIOUS_RECORD_STRING => this.ctx.getTriggerOldMap().get(record.Id)
          }
        );
      }
    } else if (this.ctx.hasTriggerNew()) {
      for (SObject record : this.ctx.getTriggerNew()) {
        inputs.add(new Map<String, Object>{ RECORD_STRING => record });
      }
    } else if (this.ctx.hasTriggerOld()) {
      for (SObject record : this.ctx.getTriggerOld()) {
        inputs.add(new Map<String, Object>{ PREVIOUS_RECORD_STRING => record });
      }
    }
    return inputs;
  }

  /**
   * @description Helper for handling successful operation results
   * Will currently update state of recordds when in a before save context
   * @param result [Invocable.Action.Result](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Invocable_Action_Result.htm#apex_class_Invocable_Action_Result) to process
   * @param index The integer index of the result/record in the trigger collection
   */
  @TestVisible
  private void handleSuccess(Invocable.Action.Result result, Integer index) {
    if (this.ctx.isBeforeInsert() || this.ctx.isBeforeUpdate()) {
      SObject previousRecord = this.ctx.getTriggerNew()[index];
      SObject updatedRecord = (SObject) result.getOutputParameters()
        .get(RECORD_STRING);
      for (String field : updatedRecord.getPopulatedFieldsAsMap().keySet()) {
        previousRecord.put(field, updatedRecord.get(field));
      }
    }
  }

  /**
   * @description Helper for handling errored operation results
   * Will currently add trigger errors to failed flow executions
   * @param result [Invocable.Action.Result](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Invocable_Action_Result.htm#apex_class_Invocable_Action_Result) to process
   * @param index The integer index of the result/record in the trigger collection
   */
  @TestVisible
  private void handleError(Invocable.Action.Result result, Integer index) {
    List<String> errors = new List<String>();
    for (Invocable.Action.Error error : result.getErrors()) {
      errors.add(error.getCode() + ':' + error.getMessage());
    }
    this.ctx.addError(
      this.ctx.getPrimaryTriggerArray()[index],
      String.join(errors, ',')
    );
  }
}
