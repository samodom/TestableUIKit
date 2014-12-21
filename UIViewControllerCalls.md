### Capturing calls to `UIViewController` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `UIViewController` that you can use to validate method calls.

`performSegueWithIdentifier:sender:`
 - `var performSegueWithIdentifierCalled: Bool`
 - `var performSegueWithIdentifierSegueIdentifier: String?`
 - `var performSegueWithIdentifierSender: AnyObject?`

`presentViewControllerCalled:animated:completion:`
 - `var presentViewControllerCalled: Bool`
 - `var viewControllerToPresent: UIKit.UIViewController?`
 - `var presentViewControllerAnimated: Bool?`
 - `var presentViewControllerCompletion: UIViewControllerPresentationCompletionClosure?`

`dismissViewController:animated:completion:`
 - `var dismissViewControllerCalled: Bool`
 - `var dismissViewControllerAnimated: Bool?`
 - `var dismissViewControllerCompletion: UIViewControllerDismissalCompletionClosure?`

`showViewController:sender:`
 - `var showViewControllerCalled: Bool`
 - `var viewControllerToShow: UIViewController?`
 - `var showViewControllerSender: AnyObject?`

 `showDetailViewController:sender:`
 - `var showDetailViewControllerCalled: Bool`
 - `var detailViewControllerToShow: UIKit.UIViewController?`
 - `var showDetailViewControllerSender: AnyObject?`


 > After capturing the call to the method, these spy methods do **not** forward their calls to the real implementation.
