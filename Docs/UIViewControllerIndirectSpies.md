`UIViewController` Spy
======================

These spies forward all method calls to the original method implementation with the exception of the `loadView` spy.

> `UIViewAnimations` is a type alias animation closures.
> 
> `UIViewAnimationCompletion` is a type alias for animation completion handlers.


**Indirect spies:**

* [`loadView`](#spying-on-loadView)
* [`viewDidLoad`](#spying-on-viewDidLoad)
* [`viewWillAppear(_:)`](#spying-on-viewWillAppear_)
* [`viewDidAppear(_:)`](#spying-on-viewDidAppear_)
* [`viewWillDisappear(_:)`](#spying-on-viewWillDisappear_)
* [`viewDidDisappear(_:)`](#spying-on-viewDidDisappear_)
* [`didReceiveMemoryWarning`](#spying-on-didReceiveMemoryWarning)
* [`updateViewConstraints`](#spying-on-updateViewConstraints)
* [`addChildViewController(_:)`](#spying-on-addChildViewController_)
* [`removeFromParentViewController`](#spying-on-removeFromParentViewController)
* [`transition(from:to:duration:options:animations:completion:)`](#spying-on-transitionfromtodurationoptionsanimationscompletion)
* [`setEditing(_:animated:)`](#spying-on-setEditing_animated)
* [`encodeRestorableState(with:)`](#spying-on-encodeRestorableStatewith)
* [`decodeRestorableState(with:)`](#spying-on-decodeRestorableStatewith)

**Direct spies:**

* [`performSegue(withIdentifier:sender:)`](#spying-on-performSeguewithIdentifiersender)
* [`present(_:animated:completion:)`](#spying-on-present_animatedcompletion)
* [`dismiss(animated:completion:)`](#spying-on-dismissanimatedcompletion)
* [`show(_:sender:)`](#spying-on-show_sender)
* [`showDetailViewController(_:sender:)`](#spying-on-showDetailViewController_sender)


## Spying on `loadView`

Use this spy to validate that a view controller has ***not*** called its superclass's implementation of `loadView`.  The spy controller is named `UIViewController.LoadViewSpyController`.  The spy method doers not forward the invocation to the original implementation.

A single evidence property indicates whether the method was called:

* `var loadViewCalled: Bool`


## Spying on `viewDidLoad`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidLoad`.  The spy controller is named `UIViewController.ViewDidLoadSpyController`.

A single evidence property indicates whether the method was called:

* `var viewDidLoadCalled: Bool`


## Spying on `viewWillAppear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewWillAppear(_:)`.  The spy controller is named `UIViewController.ViewWillAppearSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var viewWillAppearCalled: Bool`
* `var viewWillAppearAnimated: Bool?`


## Spying on `viewDidAppear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidAppear(_:)`.  The spy controller is named `UIViewController.ViewDidAppearSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var viewDidAppearCalled: Bool`
* `var viewDidAppearAnimated: Bool?`


## Spying on `viewWillDisappear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewWillDisappear(_:)`.  The spy controller is named `UIViewController.ViewWillDisappearSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var viewWillDisappearCalled: Bool`
* `var viewWillDisappearAnimated: Bool?`


## Spying on `viewDidDisappear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidDisappear(_:)`.  The spy controller is named `UIViewController.ViewDidDisappearSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var viewDidDisappearCalled: Bool`
* `var viewDidDisappearAnimated: Bool?`


## Spying on `didReceiveMemoryWarning`

Use this spy to validate that a view controller has called its superclass's implementation of `didReceiveMemoryWarning`.  The spy controller is named `UIViewController.DidReceiveMemoryWarningSpyController`.

A single evidence property indicates whether the method was called:

* `var didReceiveMemoryWarningCalled: Bool`


## Spying on `updateViewConstraints`

Use this spy to validate that a view controller has called its superclass's implementation of `updateViewConstraints`.  The spy controller is named `UIViewController.UpdateViewConstraintsSpyController`.

A single evidence property indicates whether the method was called:

* `var updateViewConstraintsCalled: Bool`


## Spying on `addChildViewController(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `addChildViewController(_:)`.  The spy controller is named `UIViewController.AddChildViewControllerSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var addChildViewControllerCalled: Bool`
* `var addChildViewControllerChild: UIViewController?`


## Spying on `removeFromParentViewController`

Use this spy to validate that a view controller has called its superclass's implementation of `removeFromParentViewController`.  The spy controller is named `UIViewController.RemoveFromParentViewControllerSpyController`.

A single evidence property indicates whether the method was called:

* `var removeFromParentViewControllerCalled: Bool`


## Spying on `transition(from:to:duration:options:animations:completion:)`

Use this spy to validate that a view controller has called its superclass's implementation of `transition(from:to:duration:options:animations:completion:)`.  The spy controller is named `UIViewController.TransitionSpyController`.

Seven evidence properties provide evidence about a potential method call:

* `var transitionCalled: Bool`
* `var transitionFromController: UIViewController?`
* `var transitionToController: UIViewController?`
* `var transitionDuration: TimeInterval?`
* `var transitionOptions: UIViewAnimationOptions?`
* `var transitionAnimations: UIViewAnimations?`
* `var transitionCompletion: UIViewAnimationCompletion?`


## Spying on `setEditing(_:animated:)`

Use this spy to validate that a view controller has called its superclass's implementation of `setEditing(_:animated:)`.  The spy controller is named `UIViewController.SetEditingSpyController`.

Three evidence properties provide evidence about a potential method call:

* `var setEditingCalled: Bool`
* `var setEditingEditing: Bool?`
* `var setEditingAnimated: Bool?`


## Spying on `encodeRestorableState(with:)`

Use this spy to validate that a view controller has called its superclass's implementation of `encodeRestorableState(with:)`.  The spy controller is named `UIViewController.EncodeRestorableStateSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var encodeRestorableStateCalled: Bool`
* `var encodeRestorableStateCoder: NSCoder?`


## Spying on `decodeRestorableState(with:)`

Use this spy to validate that a view controller has called its superclass's implementation of `decodeRestorableState(with:)`.  The spy controller is named `UIViewController.DecodeRestorableStateSpyController`.

Two evidence properties provide evidence about a potential method call:

* `var decodeRestorableStateCalled: Bool`
* `var decodeRestorableStateCoder: NSCoder?`


## Spying on `performSegue(withIdentifier:sender:)`

Use this spy to validate that a view controller has been asked to perform a segue.  The spy controller is named `UIViewController.PerformSegueSpyController`.

Three evidence properties provide evidence about a potential method call:

* `var performSegueCalled: Bool`
* `var performSegueIdentifier: String?`
* `var performSegueSender: Any?`


## Spying on `present(_:animated:completion:)`

Use this spy to validate that a view controller has been asked to present a view controller with optional animation and completion.  The spy controller is named `UIViewController.PresentSpyController`.

Four evidence properties provide evidence about a potential method call:

* `var presentCalled: Bool`
* `var presentController: UIViewController?`
* `var presentAnimated: Bool?`
* `var presentCompletion: UIViewAnimationCompletion?`


## Spying on `dismiss(animated:completion:)`

Use this spy to validate that a view controller has been asked to dismiss a view controller it has presented with optional animation and completion.  The spy controller is named `UIViewController.DismissSpyController`.

Three evidence properties provide evidence about a potential method call:

* `var dismissCalled: Bool`
* `var dismissAnimated: Bool?`
* `var dismissCompletion: UIViewAnimationCompletion?`


## Spying on `show(_:sender:)` and `showDetailViewController(_:sender:)`

Use this spy to validate that a view controller has been asked to show a (detail) view controller.  The spy controller is named `UIViewController.ShowSpyController`.

Two evidence properties provide evidence about which method was called:

* `var showCalled: Bool`
* `var showDetailViewControllerCalled: Bool`

Two additional evidence properties provide evidence about a potential method call to either method:

* `var showController: UIViewController?`
* `var showSender: Any?`
