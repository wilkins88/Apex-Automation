/**
 * @description Basic selector to separate query functionality. Does not rely on any
 * proper selector frameworks to avoid introducing any library dependencies
 *
 * @group Automation
 */
public inherited sharing class AutomationSelector {
  @TestVisible
  private static final String QUERY_STRING =
    'SELECT ApiName__c, AutomationType__c FROM SObjectAutomationHandler__mdt WHERE ' +
    'IsActive__c = true AND {0} = {1} ORDER BY Priority__c ASC NULLS LAST';

  /**
   * @description Returns active automation config for the provided sobject type
   * and trigger context
   * @param sObjType [Schema.SObjectType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectType.htm) to load automation for
   * @param op [System.TriggerOperation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_TriggerOperation.htm) for which automation should execute
   * @return List of configuration for the provided sobject/operation
   */
  public List<SObjectAutomationHandler__mdt> getAutomationHandlerConfig(
    Schema.SObjectType sObjType,
    System.TriggerOperation op
  ) {
    return (List<SObjectAutomationHandler__mdt>) Database.query(
      String.format(
        QUERY_STRING,
        new List<String>{
          this.getRelationshipApiName(op),
          '\'' +
          String.valueOf(sObjType) +
          '\''
        }
      )
    );
  }

  /**
   * @description Helper to parse a trigger operation to get the appropriate cross object field to filter on for automation
   * @param op [System.TriggerOperation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_TriggerOperation.htm) for which automation should execute
   * @return String representation of cross object field e.g. BeforeInsert__r.SObjectApiName__c
   */
  @TestVisible
  private String getRelationshipApiName(System.TriggerOperation op) {
    return String.valueOf(op).replace('_', '') + '__r.SObjectApiName__c';
  }
}
