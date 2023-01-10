---
layout: default
---
# ContextAutomationHandlerFactory

`APIVERSION: 55`

`STATUS: ACTIVE`

Creates automation handlers based on the SObject for which the automation is executing and the
context for which the automation is executing in. Refer to [IAutomationHandlerFactory](./IAutomationHandlerFactory.md) for more details


**Implemented types**

[IAutomationHandlerFactory](./IAutomationHandlerFactory.md)


**Group** Automation

## Constructors
### `ContextAutomationHandlerFactory(Schema sObjType, System op)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`sObjType`|[Schema.SObjectType](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_class_Schema_SObjectType.htm) to load automation for|

---
## Methods
### `createHandlers()`

Creates and returns the handlers to be used based on injected sobject type and automation context

#### Return

**Type**

List&lt;IAutomationHandler&gt;

**Description**

List of [IAutomationHandler](./IAutomationHandler.md) instances to execute


**See** [IAutomationHandlerFactory](./IAutomationHandlerFactory.md)

---
