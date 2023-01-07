---
layout: default
---
# IAutomationHandlerFactory

`APIVERSION: 55`

`STATUS: ACTIVE`

Base interface for automation handler factories to implement
Allows for consumers to create their own factories to inject into the
automation dispatcher to modify behavior around record level automation


**Group** Automation

## Methods
### `createHandlers()`

Creates and returns automation handlers

#### Return

**Type**

List&lt;IAutomationHandler&gt;

**Description**

List of [IAutomationHandler](./IAutomationHandler.md) instances

---
