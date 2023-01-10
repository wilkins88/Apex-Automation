---
layout: default
---
# AutomationContextMock

`ISTEST`

`APIVERSION: 55`

`STATUS: ACTIVE`

**Inheritance**

[AutomationContext](../Automation/AutomationContext.md)
 &gt; 
AutomationContextMock

## Constructors
### `AutomationContextMock(System op, List<SObject> triggerNew, List<SObject> triggerOld)`
---
## Methods
### `override getTriggerNew()`
### `override getTriggerOld()`
### `override getTriggerNewMap()`
### `override getTriggerOldMap()`
### `override getTriggerOperation()`
### `override isBeforeInsert()`
### `override isBeforeUpdate()`
### `override isBeforeDelete()`
### `override isAfterInsert()`
### `override isAfterUpdate()`
### `override isAfterDelete()`
### `override isAfterUndelete()`
### `override addError(SObject record, String errorMessage)`
### `static getInstance()`

*Inherited*


Returns singleton for context

#### Return

**Type**

AutomationContext

**Description**

Singleton instance of the context

### `getPrimaryTriggerArray()`

*Inherited*


Returns the primary (mostly applicable) array based on context which can be used in validations, adding errors, etc.

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Trigger old if in a delete context, trigger new otherwise

### `hasTriggerNew()`

*Inherited*


Determines whether or not trigger new is populated

#### Return

**Type**

Boolean

**Description**

True if trigger new has records, false otherwise

### `hasTriggerOld()`

*Inherited*


Determines whether or not trigger old is populated

#### Return

**Type**

Boolean

**Description**

True if trigger old has records, false otherwise

---
