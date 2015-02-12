### Capturing calls to `UINavigationController` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UINavigationController` that you can use to validate method calls.

`pushViewController:animated:`
 - `var pushViewControllerCalled: Bool`
 - `var pushViewControllerViewController: UIKit.UIViewController?`
 - `var pushViewControllerAnimated: Bool?`

`popViewController:animated:`
 - `var popViewControllerCalled: Bool`
 - `var popViewControllerAnimated: Bool?`

`popToRootViewController:animated:`
 - `var popToRootViewControllerCalled: Bool`
 - `var popToRootViewControllerViewController: UIKit.UIViewController?`
 - `var popToRootViewControllerAnimated: Bool?`

`popToViewController:animated:`
 - `var popToViewControllerCalled: Bool`
 - `var popToViewControllerViewController: UIKit.UIViewController?`
 - `var popToViewControllerAnimated: Bool?`


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `navController.setShouldForwardMethodCallWithSelector("pushViewController:animated:", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
>
> The methods here that return optional values will return `nil` when forwarding is turned off.
