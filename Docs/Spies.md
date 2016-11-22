Spies
=====

The spies in this library all allow the forwarding of method calls to the original (non-spy) methods.  Each spy forwards or does not forward method calls by default.  Any exceptions to the forwarding are easily added using the method call forwarding interface that has been added to `NSObject`:

```swift
/// Overridable variable for spies to set their own default
open var forwardsMethodCallsByDefault: Bool  //  default is `true`

/// Query method for determining how a spy handles a particular method
public final func forwardsMethodCalls(for: Selector) -> Bool

/// Method for changing the forwarding behavior of a particular method
public final func addMethodCallForwardingException(for: Selector)

/// Method for resetting the forwarding behavior of a particular method
public final func removeMethodCallForwardingException(for: Selector)
```
