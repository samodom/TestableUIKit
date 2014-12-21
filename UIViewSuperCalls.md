### Capturing calls to overridden `UIView` methods

Each of the methods below have spy method equivalents that capture the calls to superclass implementation and any parameters, if available.  The properties listed below the method names list the new properties of `UIView` that you can use to validate superclass method calls.

`updateConstraints`
 - `var calledUpdateConstraints: Bool`

`drawRect:`
 - `var calledDrawRect: Bool`
 - `var drawRectRect: CGRect?`

`encodeRestorableStateWithCoder`
 - `var calledEncodeRestorableStateWithCoder: Bool`
 - `var encodeRestorableStateCoder: NSCoder?`

`decodeRestorableStateWithCoder`
 - `var calledDecodeRestorableStateWithCoder: Bool`
 - `var decodeRestorableStateCoder: NSCoder?`

> After capturing the call to the method, these spy methods forward their calls to the real implementation.
