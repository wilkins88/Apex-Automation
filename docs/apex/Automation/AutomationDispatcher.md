---
layout: default
---
# AutomationDispatcher

`APIVERSION: 55`

`STATUS: ACTIVE`

Dispatcher that gathers automation handlers and executes them in order
Also serves as a centralized layer for feature to be added, such as error handling, logging
etc.


**Group** Automation

## Constructors
### `AutomationDispatcher(IAutomationHandlerFactory factory)`

Constructor

#### Parameters

|Param|Description|
|---|---|
|`factory`|[IAutomationHandlerFactory](./IAutomationHandlerFactory.md) for producing handlers|

---
## Methods
### `dispatch()`

Loads and executes automation handlers

---
