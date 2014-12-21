//
//  UIViewControllerSuperCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIViewAnimationsClosure = () -> ()
public typealias UIViewAnimationCompletionClosure = (Bool) -> ()

public class UIViewController: UIKit.UIViewController {

    /**
      Indicates whether or not this class called the superclass implementation of `loadView`.
    */
    public var calledLoadView = false

    /**
      Indicates whether or not this class called the superclass implementation of `viewDidLoad`.
    */
    public var calledViewDidLoad = false

    /**
      Indicates whether or not this class called the superclass implementation of `viewWillAppear`.
    */
    public var calledViewWillAppear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewWillAppear`, if called.
    */
    public var viewWillAppearAnimated: Bool?

    /**
      Indicates whether or not this class called the superclass implementation of `viewDidAppear`.
    */
    public var calledViewDidAppear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewDidAppear`, if called.
    */
    public var viewDidAppearAnimated: Bool?

    /**
      Indicates whether or not this class called the superclass implementation of `viewWillDisappear`.
    */
    public var calledViewWillDisappear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewWillDisappear`, if called.
    */
    public var viewWillDisappearAnimated: Bool?

    /**
      Indicates whether or not this class called the superclass implementation of `viewDidDisappear`.
    */
    public var calledViewDidDisappear = false

    /**
      Provides the animation flag that was passed to the superclass implementation of `viewDidDisappear`, if called.
    */
    public var viewDidDisappearAnimated: Bool?

    /**
      Indicates whether or not this class called the superclass implementation of `didReceiveMemoryWarning`.
    */
    public var calledDidReceiveMemoryWarning = false

    /**
      Indicates whether or not this class called the superclass implementation of `updateViewConstraints`.
    */
    public var calledUpdateViewConstraints = false

    /**
      Indicates whether or not this class called the superclass implementation of `addedChildViewController`.
    */
    public var calledAddChildViewController = false

    /**
      Provides the last controller that was passed to the superclass implementation of `addChildViewController`, if called.
    */
    public var addedChildViewController: UIKit.UIViewController?

    /**
      Indicates whether or not this class called the superclass implementation of `removeFromParentViewController`.
    */
    public var calledRemoveFromParentViewController = false

    /**
      Indicates whether or not this class called the superclass implementation of `transitionFromViewController`.
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
      Indicates whether or not this class called the superclass implementation of `calledSetEditing`.
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
      Indicates whether or not this class called the superclass implementation of `encodeRestorableStateWithCoder`.
    */
    public var calledEncodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder`, if called.
    */
    public var encodeRestorableStateCoder: NSCoder?

    /**
      Indicates whether or not this class called the superclass implementation of `decodeRestorableStateWithCoder`.
    */
    public var calledDecodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder`, if called.
    */
    public var decodeRestorableStateCoder: NSCoder?

}


////////////////////////////////////////////////////////////////////////////////

public extension UIViewController {

    override public func loadView() {
        calledLoadView = true
        super.loadView()
    }

    override public func viewDidLoad() {
        calledViewDidLoad = true
        super.viewDidLoad()
    }

    override public func viewWillAppear(animated: Bool) {
        calledViewWillAppear = true
        viewWillAppearAnimated = animated
        super.viewWillAppear(animated)
    }

    override public func viewDidAppear(animated: Bool) {
        calledViewDidAppear = true
        viewDidAppearAnimated = animated
        super.viewDidAppear(animated)
    }

    override public func viewWillDisappear(animated: Bool) {
        calledViewWillDisappear = true
        viewWillDisappearAnimated = animated
        super.viewWillDisappear(animated)
    }

    override public func viewDidDisappear(animated: Bool) {
        calledViewDidDisappear = true
        viewDidDisappearAnimated = animated
        super.viewDidDisappear(animated)
    }

    override public func didReceiveMemoryWarning() {
        calledDidReceiveMemoryWarning = true
        super.didReceiveMemoryWarning()
    }

    override public func updateViewConstraints() {
        calledUpdateViewConstraints = true
        super.updateViewConstraints()
    }

    override public func addChildViewController(childController: UIKit.UIViewController) {
        calledAddChildViewController = true
        addedChildViewController = childController
        super.addChildViewController(childController)
    }

    override public func transitionFromViewController(fromViewController: UIKit.UIViewController, toViewController: UIKit.UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: UIViewAnimationsClosure?, completion: UIViewAnimationCompletionClosure?) {
        calledTransitionFromViewController = true
        viewControllerToTransitionFrom = fromViewController
        viewControllerToTransitionTo = toViewController
        transitionDuration = duration
        transitionAnimationOptions = options
        transitionAnimations = animations
        transitionCompletion = completion
        super.transitionFromViewController(fromViewController, toViewController: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    override public func removeFromParentViewController() {
        calledRemoveFromParentViewController = true
        super.removeFromParentViewController()
    }

    override public func setEditing(editing: Bool, animated: Bool) {
        calledSetEditing = true
        setEditingEditing = editing
        setEditingAnimated = animated
    }

    override public func encodeRestorableStateWithCoder(coder: NSCoder) {
        calledEncodeRestorableStateWithCoder = true
        encodeRestorableStateCoder = coder
        super.encodeRestorableStateWithCoder(coder)
    }

    override public func decodeRestorableStateWithCoder(coder: NSCoder) {
        calledDecodeRestorableStateWithCoder = true
        decodeRestorableStateCoder = coder
        super.decodeRestorableStateWithCoder(coder)
    }

}