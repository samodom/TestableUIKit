### Capturing calls to overridden `UIViewController` methods

Each of the methods below have spy method equivalents that capture the calls to superclass implementation and any parameters, if available.  The properties listed below the method names list the new properties of `UIViewController` that you can use to validate superclass method calls.

`loadView`
 - `var calledLoadView: Bool`

'viewDidLoad'
 - `var calledViewDidLoad: Bool`

'viewWillAppear:'
 - `var calledViewWillAppear: Bool`
 - `var viewWillAppearAnimated: Bool?`

`viewDidAppear:`
 - `var calledViewDidAppear: Bool`
 - `var viewDidAppearAnimated: Bool?`

`viewWillDisappear:`
 - `var calledViewWillDisappear: Bool`
 - `var viewWillDisappearAnimated: Bool?`

`viewDidDisappear:`
 - `var calledViewDidDisappear: Bool`
 - `var viewDidDisappearAnimated: Bool?`

`didReceiveMemoryWarning`
 - `var calledDidReceiveMemoryWarning: Bool`

`updateViewConstraints`
 - `var calledUpdateViewConstraints: Bool`

`addChildViewController:`
 - `var calledAddChildViewController: Bool`
 - `var addedChildViewController: UIKit.UIViewController?`

`removeFromParentViewController`
 - `var calledRemoveFromParentViewController: Bool`

`transitionFromViewController:toViewController:duration:options:animation:completion:`
 - `var calledTransitionFromViewController: Bool`
 - `var viewControllerToTransitionFrom: UIKit.UIViewController?`
 - `var viewControllerToTransitionTo: UIKit.UIViewController?`
 - `var transitionDuration: NSTimeInterval?`
 - `var transitionAnimationOptions: UIViewAnimationOptions?`
 - `var transitionAnimations: UIViewAnimationsClosure?`
 - `var transitionCompletion: UIViewAnimationCompletionClosure?`

`setEditing:animated:`
 - `var calledSetEditing: Bool`
 - `var setEditingEditing: Bool?`
 - `var setEditingAnimated: Bool?`

`encodeRestorableStateWithCoder:`
 - `var calledEncodeRestorableStateWithCoder: Bool`
 - `var encodeRestorableStateCoder: NSCoder?`

`decodeRestorableStateWithCoder:`
 - `var calledDecodeRestorableStateWithCoder: Bool`
 - `var decodeRestorableStateCoder: NSCoder?`

 > After capturing the call to the method, these spy methods forward their calls to the real implementation.
