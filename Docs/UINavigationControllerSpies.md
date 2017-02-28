`UINavigationController` Spies
==============================

These spies forward all method calls to the original method implementation.


**Direct spies:**

* [`pushViewController(_:animated:)`](#spying-on-pushViewController_animated)
* [`popViewController(animated:)`](#spying-on-popViewControlleranimated-and-popToViewController_animated-and-popToRootViewControlleranimated) and [`popViewController(_:animated:)`](#spying-on-popViewControlleranimated-and-popToViewController_animated-and-popToRootViewControlleranimated) and [`popToRootViewController(animated:)](#spying-on-popViewControlleranimated-and-popToViewController_animated-and-popToRootViewControlleranimated)


## Spying on `pushViewController(_:animated:)`

Use this spy to validate that a view controller has been pushed onto the navigation controller with optional animation.

Three evidence properties provide evidence about a potential method call:

* `var pushViewControllerCalled: Bool`
* `var pushedController: UIViewController?`
* `var pushViewControllerAnimated: Bool?`


## Spying on `popViewController(animated:)` and `popViewController(_:animated:)` and `popToRootViewController(animated:)`

Use this spy to validate that any number of view controllers have been popped from the navigation controller with optional animation.

Three evidence properties provide evidence about a potential method call:

* `var popCalled: Bool`
* `var poppedController: UIViewController?`
* `var poppedControllers: [UIViewController]?`
* `var popAnimated: Bool?`
