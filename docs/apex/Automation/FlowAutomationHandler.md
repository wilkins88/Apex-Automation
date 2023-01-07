---
layout: default
---
# FlowAutomationHandler

`APIVERSION: 55`

`STATUS: ACTIVE`



**Implemented types**

[IAutomationHandler](./IAutomationHandler.md)


**Descriptoin** Automation handler for wiring in flows to the automation framework This should be the preferred method over strictly record triggered flows when working in complex environments as they promote testability, governance, control, and maintainability


**Group** Automation

## Constructors
### `FlowAutomationHandler(String flowName)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`flowName`|API name of the flow that is intended to be executed|

---
## Methods
### `execute()`

**Descrption** Configures and executes the flow injected into the instance


**See** [[IAutomationHandler](./IAutomationHandler.md)]([IAutomationHandler](./IAutomationHandler.md))

---
