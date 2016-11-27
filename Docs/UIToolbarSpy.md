`UIToolbar` Spy
===============

> This spy forwards its method by default.


## Spying on `setItems(_:animated:)`

Use this spy to validate that a toolbar's items have ben set with optional animation.

### Spy Methods

* `spyOnSetItems(in:)`
* `beginSpyingOnSetItems`
* `endSpyingOnSetItems`

### Spy Variables

* `var setItemsCalled: Bool`
* `var setItemsItems: [UIBarButtonItem]?`
* `var setItemsAnimated: Bool?`
