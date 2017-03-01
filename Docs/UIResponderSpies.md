`UIResponder` Spies
===================

These spies forward all method calls to the original method implementation.


## Spying on `becomeFirstResponder`

Use this spy to validate that a responder has been asked to become the first responder.  The spy controller is named `UIResponder.BecomeFirstResponderSpyController`.

A single evidence property indicates whether the method was called:

* `var becomeFirstResponderCalled: Bool`


## Spying on `resignFirstResponder`

Use this spy to validate that a responder has been asked to resign first responder status.  The spy controller is named `UIResponder.ResignFirstResponderSpyController`.

A single evidence property indicates whether the method was called:

* `var resignFirstResponderCalled: Bool`
