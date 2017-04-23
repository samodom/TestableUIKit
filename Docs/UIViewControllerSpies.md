`UIViewController` Spies
========================

> `UIViewAnimations` is a type alias animation closures.
> 
> `UIViewAnimationsCompletion` is a type alias for animation completion handlers.


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

Use this spy to validate that a view controller has ***not*** called its superclass's implementation of `loadView`.  The spy controller is named `UIViewController.LoadViewSpyController`.  The spy method does not forward the invocation to the original implementation.

A single evidence property indicates whether the method was called:

* `var superclassLoadViewCalled: Bool`


## Spying on `viewDidLoad`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidLoad`.  The spy controller is named `UIViewController.ViewDidLoadSpyController`.  The spy method forwards the invocation to the original implementation.


A single evidence property indicates whether the method was called:

* `var superclassViewDidLoadCalled: Bool`


## Spying on `viewWillAppear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewWillAppear(_:)`.  The spy controller is named `UIViewController.ViewWillAppearSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassViewWillAppearCalled: Bool`
* `var superclassViewWillAppearAnimated: Bool?`


## Spying on `viewDidAppear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidAppear(_:)`.  The spy controller is named `UIViewController.ViewDidAppearSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassViewDidAppearCalled: Bool`
* `var superclassViewDidAppearAnimated: Bool?`


## Spying on `viewWillDisappear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewWillDisappear(_:)`.  The spy controller is named `UIViewController.ViewWillDisappearSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassViewWillDisappearCalled: Bool`
* `var superclassViewWillDisappearAnimated: Bool?`


## Spying on `viewDidDisappear(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `viewDidDisappear(_:)`.  The spy controller is named `UIViewController.ViewDidDisappearSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassViewDidDisappearCalled: Bool`
* `var superclassViewDidDisappearAnimated: Bool?`


## Spying on `didReceiveMemoryWarning`

Use this spy to validate that a view controller has called its superclass's implementation of `didReceiveMemoryWarning`.  The spy controller is named `UIViewController.DidReceiveMemoryWarningSpyController`.  The spy method forwards the invocation to the original implementation.

A single evidence property indicates whether the method was called:

* `var superclassDidReceiveMemoryWarningCalled: Bool`


## Spying on `updateViewConstraints`

Use this spy to validate that a view controller has called its superclass's implementation of `updateViewConstraints`.  The spy controller is named `UIViewController.UpdateViewConstraintsSpyController`.  The spy method forwards the invocation to the original implementation.

A single evidence property indicates whether the method was called:

* `var superclassUpdateViewConstraintsCalled: Bool`


## Spying on `addChildViewController(_:)`

Use this spy to validate that a view controller has called its superclass's implementation of `addChildViewController(_:)`.  The spy controller is named `UIViewController.AddChildViewControllerSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassAddChildViewControllerCalled: Bool`
* `var superclassAddChildViewControllerChild: UIViewController?`


## Spying on `removeFromParentViewController`

Use this spy to validate that a view controller has called its superclass's implementation of `removeFromParentViewController`.  The spy controller is named `UIViewController.RemoveFromParentViewControllerSpyController`.  The spy method forwards the invocation to the original implementation.

A single evidence property indicates whether the method was called:

* `var superclassRemoveFromParentViewControllerCalled: Bool`


## Spying on `transition(from:to:duration:options:animations:completion:)`

Use this spy to validate that a view controller has called its superclass's implementation of `transition(from:to:duration:options:animations:completion:)`.  The spy controller is named `UIViewController.TransitionIndirectSpyController`.  The spy method forwards the invocation to the original implementation by default; the forwarding behavior is configurable.

Seven evidence properties provide evidence about a potential method call:

* `var superclassTransitionCalled: Bool`
* `var superclassTransitionFromController: UIViewController?`
* `var superclassTransitionToController: UIViewController?`
* `var superclassTransitionDuration: TimeInterval?`
* `var superclassTransitionOptions: UIViewAnimationOptions?`
* `var superclassTransitionAnimations: UIViewAnimations?`
* `var superclassTransitionCompletion: UIViewAnimationsCompletion?`

**Note:** When forwarding spy method calls, neither closure is captured.


## Spying on `setEditing(_:animated:)`

Use this spy to validate that a view controller has called its superclass's implementation of `setEditing(_:animated:)`.  The spy controller is named `UIViewController.SetEditingSpyController`.  The spy method forwards the invocation to the original implementation.

Three evidence properties provide evidence about a potential method call:

* `var superclassSetEditingCalled: Bool`
* `var superclassSetEditingEditing: Bool?`
* `var superclassSetEditingAnimated: Bool?`


## Spying on `encodeRestorableState(with:)`

Use this spy to validate that a view controller has called its superclass's implementation of `encodeRestorableState(with:)`.  The spy controller is named `UIViewController.EncodeRestorableStateSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassEncodeRestorableStateCalled: Bool`
* `var superclassEncodeRestorableStateCoder: NSCoder?`


## Spying on `decodeRestorableState(with:)`

Use this spy to validate that a view controller has called its superclass's implementation of `decodeRestorableState(with:)`.  The spy controller is named `UIViewController.DecodeRestorableStateSpyController`.  The spy method forwards the invocation to the original implementation.

Two evidence properties provide evidence about a potential method call:

* `var superclassDecodeRestorableStateCalled: Bool`
* `var superclassDecodeRestorableStateCoder: NSCoder?`


## Spying on `performSegue(withIdentifier:sender:)`

Use this spy to validate that a view controller has been asked to perform a segue.  The spy controller is named `UIViewController.PerformSegueSpyController`.  The spy method forwards the invocation to the original implementation.

Three evidence properties provide evidence about a potential method call:

* `var performSegueCalled: Bool`
* `var performSegueIdentifier: String?`
* `var performSegueSender: Any?`


## Spying on `present(_:animated:completion:)`

Use this spy to validate that a view controller has been asked to present a view controller with optional animation and completion.  The spy controller is named `UIViewController.PresentSpyController`.  The spy method forwards the invocation to the original implementation by default; the forwarding behavior is configurable.


Four evidence properties provide evidence about a potential method call:

* `var presentCalled: Bool`
* `var presentController: UIViewController?`
* `var presentAnimated: Bool?`
* `var presentCompletion: UIViewAnimationCompletion?`

**Note:** When forwarding spy method calls the completion handler is not captured.


## Spying on `dismiss(animated:completion:)`

Use this spy to validate that a view controller has been asked to dismiss a view controller it has presented with optional animation and completion.  The spy controller is named `UIViewController.DismissSpyController`.  The spy method forwards the invocation to the original implementation by default; the forwarding behavior is configurable.

Three evidence properties provide evidence about a potential method call:

* `var dismissCalled: Bool`
* `var dismissAnimated: Bool?`
* `var dismissCompletion: UIViewAnimationCompletion?`

**Note:** When forwarding spy method calls the completion handler is not captured.


## Spying on `show(_:sender:)` and `showDetailViewController(_:sender:)`

Use this spy to validate that a view controller has been asked to show a (detail) view controller.  The spy controller is named `UIViewController.ShowSpyController`.  The spy method forwards the invocation to the original implementation.

Three evidence properties provide evidence about a potential method call:

* `var showCalled: Bool`
* `var showController: UIViewController?`
* `var showSender: Any?`
