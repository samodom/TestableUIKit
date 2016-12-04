`UINavigationBar` Spy
=====================

> This spy forwards its method by default.


**Available spy methods:**

* [`pushItem(_:animated:)`](#spying-on-pushItem_animated)
* [`popItem(animated:)`](#spying-on-popItemanimated)
* [`setItems(_:animated:)`](#spying-on-setItems_animated)


## Spying on `pushItem(_:animated:)`

Use this spy to validate that a navigation item has been pushed onto the bar with optional animation.

### Spy Methods

* `spyOnPushItem(in:)`
* `beginSpyingOnPushItem`
* `endSpyingOnPushItem`

### Spy Variables

* `var pushItemCalled: Bool`
* `var pushItemItem: [UINavigationItem]?`
* `var pushItemAnimated: Bool?`


## Spying on `popItem(animated:)`

Use this spy to validate that a navigation item has been popped with optional animation.

### Spy Methods

* `spyOnPopItem(in:)`
* `beginSpyingOnPopItem`
* `endSpyingOnPopItem`

### Spy Variables

* `var popItemCalled: Bool`
* `var popItemItem: [UINavigationItem]?`
* `var popItemAnimated: Bool?`


## Spying on `setItems(_:animated:)`

Use this spy to validate that a navigation bar's items have been set with optional animation.

### Spy Methods

* `spyOnSetItems(in:)`
* `beginSpyingOnSetItems`
* `endSpyingOnSetItems`

### Spy Variables

* `var setItemsCalled: Bool`
* `var setItemsItems: [UIBarButtonItem]?`
* `var setItemsAnimated: Bool?`
