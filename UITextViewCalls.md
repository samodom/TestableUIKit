### Capturing calls to `UITextView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UITextView` that you can use to validate method calls.

`becomeFirstResponder`
 - `var becomeFirstResponderCalled: Bool`

`resignFirstResponder`
 - `var resignFirstResponderCalled: Bool` (you may need to explicitly reset this value to `false` before invoking code that should call the method)

> Both of these spy methods return `true` when forwarding is turned off.

> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `nameView.setShouldForwardMethodCallWithSelector("becomeFirstResponder", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
