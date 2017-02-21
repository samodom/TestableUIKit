`UIToolbar` Spies
=================

These spies forward all method calls to the original method implementation.


## Spying on `setItems(_:animated:)`

Use this spy to validate that a toolbar's items have been set with or without optional animation.  The spy controller is named `UIToolbar.SetItemsSpyController`.

Three properties provide evidence about a potential method call:

* `var setItemsCalled: Bool`
* `var setItemsItems: [UIBarButtonItem]?`
* `var setItemsAnimated: Bool?`
