/**
 * @description Base interface for automation handler factories to implement
 * Allows for consumers to create their own factories to inject into the
 * automation dispatcher to modify behavior around record level automation
 *
 * @group Automation
 */
public interface IAutomationHandlerFactory {
  /**
   * @description Creates and returns automation handlers
   * @return List of {@link IAutomationHandler} instances
   */
  List<IAutomationHandler> createHandlers();
}
