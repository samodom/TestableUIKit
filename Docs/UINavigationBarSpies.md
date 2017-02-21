`UINavigationBar` Spies
=======================

These spies forward all method calls to the original method implementation.


**Direct spies:**

* [`pushItem(_:animated:)`](#spying-on-pushItem_animated)
* [`popItem(animated:)`](#spying-on-popItemanimated)
* [`setItems(_:animated:)`](#spying-on-setItems_animated)


## Spying on `pushItem(_:animated:)`

Use this spy to validate that a navigation item has been pushed onto the bar with optional animation.  The spy controller is named `UINavigationBar.PushItemSpyController`.

Three properties provide evidence about a potential method call:

* `var pushItemCalled: Bool`
* `var pushItemItem: [UINavigationItem]?`
* `var pushItemAnimated: Bool?`


## Spying on `popItem(animated:)`

Use this spy to validate that a navigation item has been popped with optional animation.  The spy controller is named `UINavigationBar.PopItemSpyController`.

Two properties provide evidence about a potential method call:

* `var popItemCalled: Bool`
* `var popItemAnimated: Bool?`


## Spying on `setItems(_:animated:)`

Use this spy to validate that a navigation bar's items have been set with optional animation.  The spy controller is named `UINavigationBar.SetItemsSpyController`.

Three properties provide evidence about a potential method call:

* `var setItemsCalled: Bool`
* `var setItemsItems: [UIBarButtonItem]?`
* `var setItemsAnimated: Bool?`
