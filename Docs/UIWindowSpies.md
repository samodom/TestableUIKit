`UIWindow` Spies
================

These spies forward all method calls to the original method implementation.


**Direct spies:**

* [`makeKey`](#spying-on-makeKey)
* [`makeKeyAndVisible`](#spying-on-makeKeyAndVisible)


## Spying on `makeKey`

Use this spy to validate that a window has been made the key window.

A single evidence property indicates whether the method was called:

* `var makeKeyCalled: Bool`


## Spying on `makeKeyAndVisible`

Use this spy to validate that a window has been made the key window and visible.

A single evidence property indicates whether the method was called:

* `var makeKeyAndVisibleCalled: Bool`
