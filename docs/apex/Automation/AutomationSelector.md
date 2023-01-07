---
layout: default
---
# AutomationSelector

`APIVERSION: 55`

`STATUS: ACTIVE`

Basic selector to separate query functionality. Does not rely on any
proper selector frameworks to avoid introducing any library dependencies


**Group** Automation

## Methods
### `getAutomationHandlerConfig(Schema sObjType, System op)`

Returns active automation config for the provided sobject type and trigger context

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|[Schema.SObjectType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectType.htm) to load automation for|
|`op`|[System.TriggerOperation](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_enum_System_TriggerOperation.htm) for which automation should execute|

#### Return

**Type**

List&lt;SObjectAutomationHandler__mdt&gt;

**Description**

List of configuration for the provided sobject/operation

---
