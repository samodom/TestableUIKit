`UITabBarController` Spies
==========================

## Spying on `setViewControllers(_:animated:)`

Use this spy to validate that a tab bar controller has had its implementation of `setViewControllers(_:animated:)` invoked.  The spy controller is named `UITabBarController.SetViewControllersSpyController`.  The spy method forwards the invocation to the original implementation.

Three evidence properties provide evidence about a potential method call:

* `var setViewControllersCalled: Bool`
* `var setViewControllersControllers: [UIViewController]?`
* `var setViewControllersAnimated: Bool?`
