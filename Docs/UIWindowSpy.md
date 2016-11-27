`UIWindow` Spy
==============

> This spy forwards all methods by default.


**Available spy methods:**

* [`makeKey`](#spying-on-makeKey)
* [`makeKeyAndVisible`](#spying-on-makeKeyAndVisible)


## Spying on `makeKey`

Use this spy to validate that a window has been made the key window.

### Spy Methods

* `spyOnMakeKey(in:)`
* `beginSpyingOnMakeKey`
* `endSpyingOnMakeKey`

### Spy Variables

* `var makeKeyCalled: Bool`


## Spying on `makeKeyAndVisible`

Use this spy to validate that a window has been made the key window and made visible.

### Spy Methods

* `spyOnMakeKeyAndVisible(in:)`
* `beginSpyingOnMakeKeyAndVisible`
* `endSpyingOnMakeKeyAndVisible`

### Spy Variables

* `var makeKeyAndVisibleCalled: Bool`
