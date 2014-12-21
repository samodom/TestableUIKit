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


public class UIViewController: UIKit.UIViewController {

    //  MARK: Superclass calls

    /**
      Indicates whether or not this object called the superclass implementation of `loadView`.
    */
    public var calledLoadView = false

    /**
      Indicates whether or not this object called the superclass implementation of `viewDidLoad`.
    */
    public var calledViewDidLoad = false

    /**
      Indicates whether or not this object called the superclass implementation of `viewWillAppear`.
    */
    public var calledViewWillAppear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewWillAppear`, if called.
    */
    public var viewWillAppearAnimated: Bool?

    /**
      Indicates whether or not this object called the superclass implementation of `viewDidAppear`.
    */
    public var calledViewDidAppear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewDidAppear`, if called.
    */
    public var viewDidAppearAnimated: Bool?

    /**
      Indicates whether or not this object called the superclass implementation of `viewWillDisappear`.
    */
    public var calledViewWillDisappear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewWillDisappear`, if called.
    */
    public var viewWillDisappearAnimated: Bool?

    /**
      Indicates whether or not this object called the superclass implementation of `viewDidDisappear`.
    */
    public var calledViewDidDisappear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewDidDisappear`, if called.
    */
    public var viewDidDisappearAnimated: Bool?

    /**
      Indicates whether or not this object called the superclass implementation of `didReceiveMemoryWarning`.
    */
    public var calledDidReceiveMemoryWarning = false

    /**
      Indicates whether or not this object called the superclass implementation of `updateViewConstraints`.
    */
    public var calledUpdateViewConstraints = false

    /**
      Indicates whether or not this object called the superclass implementation of `addedChildViewController`.
    */
    public var calledAddChildViewController = false

    /**
      Provides the last controller that was passed to the superclass implementation of `addChildViewController`, if called.
    */
    public var addedChildViewController: UIKit.UIViewController?

    /**
      Indicates whether or not this object called the superclass implementation of `removeFromParentViewController`.
    */
    public var calledRemoveFromParentViewController = false

    /**
      Indicates whether or not this object called the superclass implementation of `transitionFromViewController`.
    */
    public var calledTransitionFromViewController = false

    /**
      Provides the 'from' child controller that was passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var viewControllerToTransitionFrom: UIKit.UIViewController?

    /**
      Provides the 'to' child controller that was passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var viewControllerToTransitionTo: UIKit.UIViewController?

    /**
      Provides the duration that was passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var transitionDuration: NSTimeInterval?

    /**
      Provides the animation options that were passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var transitionAnimationOptions: UIViewAnimationOptions?

    /**
      Provides the animation closure that was passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var transitionAnimations: UIViewAnimationsClosure?

    /**
      Provides the completion closure that was passed to the superclass implementation of `transitionFromViewController`, if called.
    */
    public var transitionCompletion: UIViewAnimationCompletionClosure?

    /**
      Indicates whether or not this object called the superclass implementation of `calledSetEditing`.
    */
    public var calledSetEditing = false

    /**
      Provides the editing flag that was passed to the superclass implementation of `setEditing`, if called.
    */
    public var setEditingEditing: Bool?

    /**
      Provides the animation flag that was passed to the superclass implementation of `setEditing`, if called.
    */
    public var setEditingAnimated: Bool?

    /**
      Indicates whether or not this object called the superclass implementation of `encodeRestorableStateWithCoder`.
    */
    public var calledEncodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder`, if called.
    */
    public var encodeRestorableStateCoder: NSCoder?

    /**
      Indicates whether or not this object called the superclass implementation of `decodeRestorableStateWithCoder`.
    */
    public var calledDecodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder`, if called.
    */
    public var decodeRestorableStateCoder: NSCoder?


    //  MARK: Class spies

    /**
      Indicates whether or not the `performSegueWithIdentifier` method has been called on this object.
    */
    public var performSegueWithIdentifierCalled = false

    /**
      Provides the segue identifier that was passed to the `performSegueWithIdentifier` method on this object, if called.
    */
    public var performSegueWithIdentifierSegueIdentifier: String?

    /**
      Provides the sender that was passed to the `performSegueWithIdentifier` method on this object, if called.
    */
    public var performSegueWithIdentifierSender: AnyObject?

    /**
      Indicates whether or not the `presentViewController` method has been called on this object.
    */
    public var presentViewControllerCalled = false

    /**
      Provides the view controller that was passed to the `presentViewController` method on this object, if called.
    */
    public var viewControllerToPresent: UIKit.UIViewController?

    /**
      Provides the animation flag that was passed to the `presentViewController` method on this object, if called.
    */
    public var presentViewControllerAnimated: Bool?

    /**
      Provides the completion closure that was passed to the `presentViewController` method on this object, if called.
    */
    public var presentViewControllerCompletion: UIViewControllerPresentationCompletionClosure?

    /**
      Indicates whether or not the `dismissViewControllerAnimated` method has been called on this object.
    */
    public var dismissViewControllerCalled = false

    /**
      Provides the animation flag that was passed to the `dismissViewControllerAnimated` method on this object, if called.
    */
    public var dismissViewControllerAnimated: Bool?

    /**
      Provides the completion closure that was passed to the `dismissViewControllerAnimated` method on this object, if called.
    */
    public var dismissViewControllerCompletion: UIViewControllerDismissalCompletionClosure?

    /**
      Indicates whether or not the `showViewController` method has been called on this object.
    */
    public var showViewControllerCalled = false

    /**
      Provides the view controller that was passed to the `showViewController` method on this object, if called.
    */
    public var viewControllerToShow: UIKit.UIViewController?

    /**
      Provides the sender that was passed to the `showViewController` method on this object, if called.
    */
    public var showViewControllerSender: AnyObject?

    /**
      Indicates whether or not the `showDetailViewController` method has been called on this object.
    */
    public var showDetailViewControllerCalled = false

    /**
      Provides the detail view controller that was passed to the `showDetailViewController` method on this object, if called.
    */
    public var detailViewControllerToShow: UIKit.UIViewController?

    /**
      Provides the sender that was passed to the `showDetailViewController` method on this object, if called.
    */
    public var showDetailViewControllerSender: AnyObject?

}
