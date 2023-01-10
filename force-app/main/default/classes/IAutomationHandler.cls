/**
 * @description Base class for all automation handlers to implement.
 * Handlers should be as fine-grained as possible to promote testability,
 * modularity, and control
 *
 * @group Automation
 */
public interface IAutomationHandler {
  /**
   * @description Executes handler logic
   */
  void execute();
}
