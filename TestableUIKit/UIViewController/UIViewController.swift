//
//  UIViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIViewAnimationsHandler = () -> ()
public typealias UIViewAnimationCompletionHandler = (Bool) -> ()

public typealias UIViewControllerPresentationCompletionHandler = () -> ()
public typealias UIViewControllerDismissalCompletionHandler = () -> ()


public class UIViewController: UIKit.UIViewController, ShimMethodForwarding {

    //  MARK: Superclass calls

    /*!
        Indicates whether or not this object called the superclass implementation of `loadView`.
    */
    public var calledLoadView = false

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidLoad`.
    */
    public var calledViewDidLoad = false

    /*!
        Indicates whether or not this object called the superclass implementation of `viewWillAppear:`.
    */
    public var calledViewWillAppear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewWillAppear:`, if called.
    */
    public var viewWillAppearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidAppear:`.
    */
    public var calledViewDidAppear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewDidAppear:`, if called.
    */
    public var viewDidAppearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewWillDisappear:`.
    */
    public var calledViewWillDisappear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewWillDisappear:`, if called.
    */
    public var viewWillDisappearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `viewDidDisappear:`.
    */
    public var calledViewDidDisappear = false

    /*!
        Provides the animation flag that was passed to the superclass implementation of `viewDidDisappear:`, if called.
    */
    public var viewDidDisappearAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `didReceiveMemoryWarning`.
    */
    public var calledDidReceiveMemoryWarning = false

    /*!
        Indicates whether or not this object called the superclass implementation of `updateViewConstraints`.
    */
    public var calledUpdateViewConstraints = false

    /*!
        Indicates whether or not this object called the superclass implementation of `addedChildViewController:`.
    */
    public var calledAddChildViewController = false

    /*!
        Provides the last controller that was passed to the superclass implementation of `addChildViewController:`, if called.
    */
    public var addedChildViewController: UIKit.UIViewController?

    /*!
        Indicates whether or not this object called the superclass implementation of `removeFromParentViewController`.
    */
    public var calledRemoveFromParentViewController = false

    /*!
        Indicates whether or not this object called the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`.
    */
    public var calledTransitionFromViewController = false

    /*!
        Provides the 'from' child controller that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var viewControllerToTransitionFrom: UIKit.UIViewController?

    /*!
        Provides the 'to' child controller that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var viewControllerToTransitionTo: UIKit.UIViewController?

    /*!
        Provides the duration that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var transitionDuration: NSTimeInterval?

    /*!
        Provides the animation options that were passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var transitionAnimationOptions: UIViewAnimationOptions?

    /*!
        Provides the animation closure that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var transitionAnimations: UIViewAnimationsHandler?

    /*!
        Provides the completion closure that was passed to the superclass implementation of `transitionFromViewController:toViewController:duration:options:animations:completion:`, if called.
    */
    public var transitionCompletion: UIViewAnimationCompletionHandler?

    /*!
        Indicates whether or not this object called the superclass implementation of `setEditing:animated:`.
    */
    public var calledSetEditing = false

    /*!
        Provides the editing flag that was passed to the superclass implementation of `setEditing:animated:`, if called.
    */
    public var setEditingEditing: Bool?

    /*!
        Provides the animation flag that was passed to the superclass implementation of `setEditing:animated:`, if called.
    */
    public var setEditingAnimated: Bool?

    /*!
        Indicates whether or not this object called the superclass implementation of `encodeRestorableStateWithCoder`:.
    */
    public var calledEncodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder:`, if called.
    */
    public var encodeRestorableStateCoder: NSCoder?

    /*!
        Indicates whether or not this object called the superclass implementation of `decodeRestorableStateWithCoder:`.
    */
    public var calledDecodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder:`, if called.
    */
    public var decodeRestorableStateCoder: NSCoder?


    //  MARK: Class spies

    /*!
        Indicates whether or not the `performSegueWithIdentifier:sender:` method has been called on this object.
    */
    public var performSegueWithIdentifierCalled = false

    /*!
        Provides the segue identifier that was passed to the `performSegueWithIdentifier:sender:` method on this object, if called.
    */
    public var performSegueWithIdentifierSegueIdentifier: String?

    /*!
        Provides the sender that was passed to the `performSegueWithIdentifier:sender:` method on this object, if called.
    */
    public var performSegueWithIdentifierSender: AnyObject?

    /*!
        Indicates whether or not the `presentViewController:animated:completion:` method has been called on this object.
    */
    public var presentViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    public var viewControllerToPresent: UIKit.UIViewController?

    /*!
        Provides the animation flag that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    public var presentViewControllerAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `presentViewController:animated:completion:` method on this object, if called.
    */
    public var presentViewControllerCompletion: UIViewControllerPresentationCompletionHandler?

    /*!
        Indicates whether or not the `dismissViewControllerAnimated:completion:` method has been called on this object.
    */
    public var dismissViewControllerCalled = false

    /*!
        Provides the animation flag that was passed to the `dismissViewControllerAnimated:completion:` method on this object, if called.
    */
    public var dismissViewControllerAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `dismissViewControllerAnimated:completion:` method on this object, if called.
    */
    public var dismissViewControllerCompletion: UIViewControllerDismissalCompletionHandler?

    /*!
        Indicates whether or not the `showViewController:sender:` method has been called on this object.
    */
    public var showViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `showViewController:sender:` method on this object, if called.
    */
    public var viewControllerToShow: UIKit.UIViewController?

    /*!
        Provides the sender that was passed to the `showViewController:sender:` method on this object, if called.
    */
    public var showViewControllerSender: AnyObject?

    /*!
        Indicates whether or not the `showDetailViewController:sender:` method has been called on this object.
    */
    public var showDetailViewControllerCalled = false

    /*!
        Provides the detail view controller that was passed to the `showDetailViewController:sender:` method on this object, if called.
    */
    public var detailViewControllerToShow: UIKit.UIViewController?

    /*!
        Provides the sender that was passed to the `showDetailViewController:sender:` method on this object, if called.
    */
    public var showDetailViewControllerSender: AnyObject?

    public static var shouldForwardMethodsByDefault = true

    public static var methodForwardingList = ShimMethodForwardingList()

    public enum UIViewControllerTestableSelectors {
        public static let PerformSegue = #selector(
            UIViewController.performSegueWithIdentifier(_:sender:)
        )

        public static let PresentViewController = #selector(
            UIViewController.presentViewController(_:animated:completion:)
        )

        public static let DismissViewController = #selector(
            UIViewController.dismissViewControllerAnimated(_:completion:)
        )

        public static let ShowViewController = #selector(
            UIViewController.showViewController(_:sender:)
        )

        public static let ShowDetailViewController = #selector(
            UIViewController.showDetailViewController(_:sender:)
        )
    }

}
