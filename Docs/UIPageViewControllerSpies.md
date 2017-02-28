`UINavigationController` Spies
==============================

**Direct spies:**

* [`setViewControllers(_:direction:animated:completion:)`
](#spying-on-setViewControllers_directionanimatedcompletion))


## Spying on `setViewControllers(_:direction:animated:completion:)`

Use this spy to validate that a page view controller has been asked to set its view controllers.  The spy controller is named `UIPageViewController.SetViewControllersSpyController`.  The spy method forwards the invocation to the original implementation by default; the forwarding behavior is configurable.

Three evidence properties provide evidence about a potential method call:

* `var setViewControllersCalled: Bool`
* `var setViewControllersDirection: UIPageViewControllerNavigationDirection?`
* `var setViewControllersAnimated: Bool?`
* `var setViewControllersCompletion: UIViewAnimationsCompletion?`

**Note:** When forwarding spy method calls the completion handler is not captured.
