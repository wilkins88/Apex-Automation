/**
 * @description Singleton wrapper around Trigger functionality to help
 * decouple automation logic from system level dependencies. Virtual so that
 * the singleton can be mocked in unit tests
 *
 * @group Automation
 */
public virtual inherited sharing class AutomationContext {
  @TestVisible
  private static AutomationContext instance;

  /**
   * @description Returns singleton for context
   * @return Singleton instance of the context
   */
  public static AutomationContext getInstance() {
    if (instance == null) {
      instance = new AutomationContext();
    }
    return instance;
  }

  /**
   * @description Returns the primary (mostly applicable) array based on context
   * which can be used in validations, adding errors, etc.
   * @return Trigger old if in a delete context, trigger new otherwise
   */
  public virtual List<SObject> getPrimaryTriggerArray() {
    if (this.isBeforeDelete() || this.isAfterDelete()) {
      return this.getTriggerOld();
    } else {
      return this.getTriggerNew();
    }
  }

  /**
   * @description Determines whether or not trigger new is populated
   * @return True if trigger new has records, false otherwise
   */
  public virtual Boolean hasTriggerNew() {
    return (this.getTriggerNew() != null && this.getTriggerNew().size() > 0);
  }

  /**
   * @description Determines whether or not trigger old is populated
   * @return True if trigger old has records, false otherwise
   */
  public virtual Boolean hasTriggerOld() {
    return (this.getTriggerOld() != null && this.getTriggerOld().size() > 0);
  }

  /**
   * @description Trigger new getter
   * @return List of new trigger records
   */
  public virtual List<SObject> getTriggerNew() {
    return Trigger.new;
  }

  /**
   * @description Trigger old getter
   * @return List of old trigger records
   */
  public virtual List<SObject> getTriggerOld() {
    return Trigger.old;
  }

  /**
   * @description Trigger new map getter
   * @return Map of new trigger record ids to records
   */
  public virtual Map<Id, SObject> getTriggerNewMap() {
    return Trigger.newMap;
  }

  /**
   * @description Trigger old map getter
   * @return Map of old trigger record ids to records
   */
  public virtual Map<Id, SObject> getTriggerOldMap() {
    return Trigger.oldMap;
  }

  /**
   * @description Trigger operation type getter
   * @return [System.TriggerOperation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_TriggerOperation.htm) enum based on context
   */
  public virtual System.TriggerOperation getTriggerOperation() {
    return Trigger.operationType;
  }

  /**
   * @description Before insert context check
   * @return True if before insert, false otherwise
   */
  public virtual Boolean isBeforeInsert() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_INSERT;
  }

  /**
   * @description Before update context check
   * @return True if before update, false otherwise
   */
  public virtual Boolean isBeforeUpdate() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_UPDATE;
  }

  /**
   * @description Before delete context check
   * @return True if before delete, false otherwise
   */
  public virtual Boolean isBeforeDelete() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_DELETE;
  }

  /**
   * @description After insert context check
   * @return True if after insert, false otherwise
   */
  public virtual Boolean isAfterInsert() {
    return Trigger.operationType == System.TriggerOperation.AFTER_INSERT;
  }

  /**
   * @description After update context check
   * @return True if after update, false otherwise
   */
  public virtual Boolean isAfterUpdate() {
    return Trigger.operationType == System.TriggerOperation.AFTER_UPDATE;
  }

  /**
   * @description After delete context check
   * @return True if after delete, false otherwise
   */
  public virtual Boolean isAfterDelete() {
    return Trigger.operationType == System.TriggerOperation.AFTER_DELETE;
  }

  /**
   * @description After undelete context check
   * @return True if after undelete, false otherwise
   */
  public virtual Boolean isAfterUndelete() {
    return Trigger.operationType == System.TriggerOperation.AFTER_UNDELETE;
  }

  /**
   * @description Adds an error to the record, can only be called in a trigger context
   * @param record SObject record
   */
  public virtual void addError(SObject record, String errorMessage) {
    record.addError(errorMessage);
  }

  protected AutomationContext() {
  }
}
