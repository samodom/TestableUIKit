//
//  UIViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIViewAnimationsClosure = () -> ()
public typealias UIViewAnimationCompletionClosure = (Bool) -> ()

public typealias UIViewControllerPresentationCompletionClosure = () -> ()
public typealias UIViewControllerDismissalCompletionClosure = () -> ()


open class UIViewController: UIKit.UIViewController {

    //  MARK: Superclass calls

    /*!
        Indicates whether or not this object called the superclass implementation of `loadView`.
    */
    open var calledLoadView = false

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidLoad`.
    */
    open var calledViewDidLoad = false

    /*!
        Indicates whether or not this object called the superclass implementation of `viewWillAppear:`.
    */
    open var calledViewWillAppear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewWillAppear:`, if called.
    */
    open var viewWillAppearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidAppear:`.
    */
    open var calledViewDidAppear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewDidAppear:`, if called.
    */
    open var viewDidAppearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewWillDisappear:`.
    */
    open var calledViewWillDisappear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewWillDisappear:`, if called.
    */
    open var viewWillDisappearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidDisappear:`.
    */
    open var calledViewDidDisappear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewDidDisappear:`, if called.
    */
    open var viewDidDisappearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `didReceiveMemoryWarning`.
    */
    open var calledDidReceiveMemoryWarning = false

    /*!
        Indicates whether or not this object called the superclass implementation of `updateViewConstraints`.
    */
    open var calledUpdateViewConstraints = false

    /*!
        Indicates whether or not this object called the superclass implementation of `addedChildViewController:`.
    */
    open var calledAddChildViewController = false

    /*!
        Provides the last controller that was passed to the superclass implementation of `addChildViewController:`, if called.
    */
    open var addedChildViewController: UIKit.UIViewController?

    /*!
        Indicates whether or not this object called the superclass implementation of `removeFromParentViewController`.
    */
    open var calledRemoveFromParentViewController = false

    /*!
        Indicates whether or not this object called the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`.
    */
    open var calledTransitionFromViewController = false

    /*!
        Provides the 'from' child controller that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var viewControllerToTransitionFrom: UIKit.UIViewController?

    /*!
        Provides the 'to' child controller that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var viewControllerToTransitionTo: UIKit.UIViewController?

    /*!
        Provides the duration that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var transitionDuration: TimeInterval?

    /*!
        Provides the animation options that were passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var transitionAnimationOptions: UIViewAnimationOptions?

    /*!
        Provides the animation closure that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var transitionAnimations: UIViewAnimationsClosure?

    /*!
        Provides the completion closure that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    open var transitionCompletion: UIViewAnimationCompletionClosure?

    /*!
        Indicates whether or not this object called the superclass implementation of `setEditing:animated:`.
    */
    open var calledSetEditing = false

    /*!
        Provides the editing flag that was passed to the superclass implementation of `setEditing:animated:`, if called.
    */
    open var setEditingEditing: Bool?

    /*!
        Provides the animation flag that was passed to the superclass implementation of `setEditing:animated:`, if called.
    */
    open var setEditingAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `encodeRestorableStateWithCoder`:.
    */
    open var calledEncodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder:`, if called.
    */
    open var encodeRestorableStateCoder: NSCoder?

    /*!
        Indicates whether or not this object called the superclass implementation of `decodeRestorableStateWithCoder:`.
    */
    open var calledDecodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder:`, if called.
    */
    open var decodeRestorableStateCoder: NSCoder?


    //  MARK: Class spies

    /*!
        Indicates whether or not the `performSegueWithIdentifier:sender:` method has been called on this object.
    */
    open var performSegueWithIdentifierCalled = false

    /*!
        Provides the segue identifier that was passed to the `performSegueWithIdentifier:sender:` method on this object, if called.
    */
    open var performSegueWithIdentifierSegueIdentifier: String?

    /*!
        Provides the sender that was passed to the `performSegueWithIdentifier:sender:` method on this object, if called.
    */
    open var performSegueWithIdentifierSender: AnyObject?

    /*!
        Indicates whether or not the `presentViewController:animated:completion:` method has been called on this object.
    */
    open var presentViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    open var viewControllerToPresent: UIKit.UIViewController?

    /*!
        Provides the animation flag that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    open var presentViewControllerAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    open var presentViewControllerCompletion: UIViewControllerPresentationCompletionClosure?

    /*!
        Indicates whether or not the `dismissViewControllerAnimated:completion:` method has been called on this object.
    */
    open var dismissViewControllerCalled = false

    /*!
        Provides the animation flag that was passed to the `dismissViewControllerAnimated:completion:` method on this object, if called.
    */
    open var dismissViewControllerAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `dismissViewControllerAnimated:completion:` method on this object, if called.
    */
    open var dismissViewControllerCompletion: UIViewControllerDismissalCompletionClosure?

    /*!
        Indicates whether or not the `showViewController:sender:` method has been called on this object.
    */
    open var showViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `showViewController:sender:` method on this object, if called.
    */
    open var viewControllerToShow: UIKit.UIViewController?

    /*!
        Provides the sender that was passed to the `showViewController:sender:` method on this object, if called.
    */
    open var showViewControllerSender: AnyObject?

    /*!
        Indicates whether or not the `showDetailViewController:sender:` method has been called on this object.
    */
    open var showDetailViewControllerCalled = false

    /*!
        Provides the detail view controller that was passed to the `showDetailViewController:sender:` method on this object, if called.
    */
    open var detailViewControllerToShow: UIKit.UIViewController?

    /*!
        Provides the sender that was passed to the `showDetailViewController:sender:` method on this object, if called.
    */
    open var showDetailViewControllerSender: AnyObject?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
