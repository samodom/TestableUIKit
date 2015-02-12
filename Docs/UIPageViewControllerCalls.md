### Capturing calls to `UIPageViewController` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UIPageViewController` that you can use to validate method calls.


`setViewControllers:direction:animated:completion:`
 - `var setViewControllersCalled: Bool`
 - `var setViewControllersViewControllers: UIKit.UIViewController?`
 - `var setViewControllersDirection: Bool?`
 - `var setViewControllersAnimated: Bool?`
 - `var setViewControllersCompletion: Bool?`


> After capturing the call to the method, this spy forwards the call to the superclass (real) implementation.  If you would like for the spy to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test:
>
> `pageController.setShouldForwardMethodCallWithSelector("setViewControllers:direction:animated:completion:", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
