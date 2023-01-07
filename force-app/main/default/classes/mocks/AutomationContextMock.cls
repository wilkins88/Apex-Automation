@IsTest
public inherited sharing class AutomationContextMock extends AutomationContext {
  @TestVisible
  private System.TriggerOperation op;
  @TestVisible
  private String errorMessage;
  @TestVisible
  private List<SObject> triggerNew;
  @TestVisible
  private List<SObject> triggerOld;
  @TestVisible
  private Map<Id, SObject> triggerNewMap {
    get {
      if (this.triggerNewMap == null) {
        this.triggerNewMap = new Map<Id, SObject>();
      }
      return this.triggerNewMap;
    }
    set;
  }
  @TestVisible
  private Map<Id, SObject> triggerOldMap {
    get {
      if (this.triggerOldMap == null) {
        this.triggerOldMap = new Map<Id, SObject>();
      }
      return this.triggerOldMap;
    }
    set;
  }

  public AutomationContextMock(
    System.TriggerOperation op,
    List<SObject> triggerNew,
    List<SObject> triggerOld
  ) {
    this.op = op;
    this.triggerNew = triggerNew;
    this.triggerOld = triggerOld;
    for (SObject record : this.triggerNew) {
      if (String.isNotBlank(record.Id)) {
        this.triggerNewMap.put(record.Id, record);
      }
    }
    for (SObject record : this.triggerOld) {
      if (String.isNotBlank(record.Id)) {
        this.triggerOldMap.put(record.Id, record);
      }
    }
  }

  public override List<SObject> getTriggerNew() {
    return this.triggerNew;
  }

  public override List<SObject> getTriggerOld() {
    return this.triggerOld;
  }

  public override Map<Id, SObject> getTriggerNewMap() {
    return this.triggerNewMap;
  }

  public override Map<Id, SObject> getTriggerOldMap() {
    return this.triggerOldMap;
  }

  public override System.TriggerOperation getTriggerOperation() {
    return this.op;
  }

  public override Boolean isBeforeInsert() {
    return this.op == System.TriggerOperation.BEFORE_INSERT;
  }

  public override Boolean isBeforeUpdate() {
    return this.op == System.TriggerOperation.BEFORE_UPDATE;
  }

  public override Boolean isBeforeDelete() {
    return this.op == System.TriggerOperation.BEFORE_DELETE;
  }

  public override Boolean isAfterInsert() {
    return this.op == System.TriggerOperation.AFTER_INSERT;
  }

  public override Boolean isAfterUpdate() {
    return this.op == System.TriggerOperation.AFTER_UPDATE;
  }

  public override Boolean isAfterDelete() {
    return this.op == System.TriggerOperation.AFTER_DELETE;
  }

  public override Boolean isAfterUndelete() {
    return this.op == System.TriggerOperation.AFTER_UNDELETE;
  }

  public override void addError(SObject record, String errorMessage) {
    this.errorMessage = errorMessage;
  }
}
