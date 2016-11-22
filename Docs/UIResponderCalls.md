`UIResponder` Spy
=================

## Spying on `becomeFirstResponder`

### Spy Methods

* `spyOnBecomeFirstResponder(_:)`
* `beginSpyingOnBecomeFirstResponder`
* `endSpyingOnBecomeFirstResponder`

> After capturing the call to the method, the spy forwards the call to the original (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
> `myField.addMethodCallForwardingException(forSelector: #selector(UIResponder.becomeFirstResponder))`
>
> This can be reversed in your test at any time by calling the following:
> `myField.removeMethodCallForwardingException(forSelector: #selector(UIResponder.becomeFirstResponder))`
>
> The spy returns `true` when forwarding is turned off.


### Spy Variables

`var becomeFirstResponderCalled: Bool`




## Spying on `resignFirstResponder`

### Spy Methods

* `spyOnResignFirstResponder(_:)`
* `beginSpyingOnResignFirstResponder`
* `endSpyingOnResignFirstResponder`


### Spy Variables

`var resignFirstResponderCalled: Bool`

> After capturing the call to the method, the spy forwards the call to the original (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
> `myField.addMethodCallForwardingException(forSelector: #selector(UIResponder.resignFirstResponder))`
>
> This can be reversed in your test at any time by calling the following:
> `myField.removeMethodCallForwardingException(forSelector: #selector(UIResponder.resignFirstResponder))`
>
> The spy returns `true` when forwarding is turned off.
