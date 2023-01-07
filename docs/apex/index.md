---
layout: default
---
# Classes
## Automation

### [AutomationContext](./Automation/AutomationContext.md)

Singleton wrapper around Trigger functionality to help
decouple automation logic from system level dependencies. Virtual so that
the singleton can be mocked in unit tests



### [AutomationDispatcher](./Automation/AutomationDispatcher.md)

Dispatcher that gathers automation handlers and executes them in order
Also serves as a centralized layer for feature to be added, such as error handling, logging
etc.



### [AutomationSelector](./Automation/AutomationSelector.md)

Basic selector to separate query functionality. Does not rely on any
proper selector frameworks to avoid introducing any library dependencies



### [ContextAutomationHandlerFactory](./Automation/ContextAutomationHandlerFactory.md)

Creates automation handlers based on the SObject for which the automation is executing and the
context for which the automation is executing in. Refer to [IAutomationHandlerFactory](./Automation/IAutomationHandlerFactory.md) for more details



### [FlowAutomationHandler](./Automation/FlowAutomationHandler.md)




### [IAutomationHandler](./Automation/IAutomationHandler.md)

Base class for all automation handlers to implement.
Handlers should be as fine-grained as possible to promote testability,
modularity, and control



### [IAutomationHandlerFactory](./Automation/IAutomationHandlerFactory.md)

Base interface for automation handler factories to implement
Allows for consumers to create their own factories to inject into the
automation dispatcher to modify behavior around record level automation


## Miscellaneous

### [AutomationContextMock](./Miscellaneous/AutomationContextMock.md)


### [AutomationHandlerFactoryMock](./Miscellaneous/AutomationHandlerFactoryMock.md)


### [AutomationHandlerMock](./Miscellaneous/AutomationHandlerMock.md)


### [AutomationSelectorMock](./Miscellaneous/AutomationSelectorMock.md)

