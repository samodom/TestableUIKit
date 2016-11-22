`UIResponder` Spy
=================

> This spy forwards all methods by default.


## Spying on `becomeFirstResponder`

Use this spy to validate that a responder has been asked to become the first responder.

### Spy Methods

* `spyOnBecomeFirstResponder(in:)`
* `beginSpyingOnBecomeFirstResponder`
* `endSpyingOnBecomeFirstResponder`

> This spy method returns `true` when forwarding is turned off.

### Spy Variables

* `var becomeFirstResponderCalled: Bool`


## Spying on `resignFirstResponder`

Use this spy to validate that a responder has been asked to resign first responder status.

### Spy Methods

* `spyOnResignFirstResponder(in:)`
* `beginSpyingOnResignFirstResponder`
* `endSpyingOnResignFirstResponder`

> This spy method returns `true` when forwarding is turned off.

### Spy Variables

* `var resignFirstResponderCalled: Bool`
