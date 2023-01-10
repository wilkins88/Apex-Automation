---
layout: default
---
# AutomationContext

`APIVERSION: 55`

`STATUS: ACTIVE`

Singleton wrapper around Trigger functionality to help
decouple automation logic from system level dependencies. Virtual so that
the singleton can be mocked in unit tests


**Group** Automation

## Methods
### `static getInstance()`

Returns singleton for context

#### Return

**Type**

AutomationContext

**Description**

Singleton instance of the context

### `getPrimaryTriggerArray()`

Returns the primary (mostly applicable) array based on context which can be used in validations, adding errors, etc.

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Trigger old if in a delete context, trigger new otherwise

### `hasTriggerNew()`

Determines whether or not trigger new is populated

#### Return

**Type**

Boolean

**Description**

True if trigger new has records, false otherwise

### `hasTriggerOld()`

Determines whether or not trigger old is populated

#### Return

**Type**

Boolean

**Description**

True if trigger old has records, false otherwise

### `getTriggerNew()`

Trigger new getter

#### Return

**Type**

List&lt;SObject&gt;

**Description**

List of new trigger records

### `getTriggerOld()`

Trigger old getter

#### Return

**Type**

List&lt;SObject&gt;

**Description**

List of old trigger records

### `getTriggerNewMap()`

Trigger new map getter

#### Return

**Type**

Map&lt;Id,SObject&gt;

**Description**

Map of new trigger record ids to records

### `getTriggerOldMap()`

Trigger old map getter

#### Return

**Type**

Map&lt;Id,SObject&gt;

**Description**

Map of old trigger record ids to records

### `getTriggerOperation()`

Trigger operation type getter

#### Return

**Type**

System

**Description**

[System.TriggerOperation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_TriggerOperation.htm) enum based on context

### `isBeforeInsert()`

Before insert context check

#### Return

**Type**

Boolean

**Description**

True if before insert, false otherwise

### `isBeforeUpdate()`

Before update context check

#### Return

**Type**

Boolean

**Description**

True if before update, false otherwise

### `isBeforeDelete()`

Before delete context check

#### Return

**Type**

Boolean

**Description**

True if before delete, false otherwise

### `isAfterInsert()`

After insert context check

#### Return

**Type**

Boolean

**Description**

True if after insert, false otherwise

### `isAfterUpdate()`

After update context check

#### Return

**Type**

Boolean

**Description**

True if after update, false otherwise

### `isAfterDelete()`

After delete context check

#### Return

**Type**

Boolean

**Description**

True if after delete, false otherwise

### `isAfterUndelete()`

After undelete context check

#### Return

**Type**

Boolean

**Description**

True if after undelete, false otherwise

### `addError(SObject record, String errorMessage)`

Adds an error to the record, can only be called in a trigger context

#### Parameters

|Param|Description|
|---|---|
|`record`|SObject record|

---
