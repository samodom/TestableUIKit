//
//  UIViewControllersSuperCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIViewController {

    public override func loadView() {
        calledLoadView = true
        super.loadView()
    }

    public override func viewDidLoad() {
        calledViewDidLoad = true
        super.viewDidLoad()
    }

    public override func viewWillAppear(animated: Bool) {
        calledViewWillAppear = true
        viewWillAppearAnimated = animated
        super.viewWillAppear(animated)
    }

    public override func viewDidAppear(animated: Bool) {
        calledViewDidAppear = true
        viewDidAppearAnimated = animated
        super.viewDidAppear(animated)
    }

    public override func viewWillDisappear(animated: Bool) {
        calledViewWillDisappear = true
        viewWillDisappearAnimated = animated
        super.viewWillDisappear(animated)
    }

    public override func viewDidDisappear(animated: Bool) {
        calledViewDidDisappear = true
        viewDidDisappearAnimated = animated
        super.viewDidDisappear(animated)
    }

    public override func didReceiveMemoryWarning() {
        calledDidReceiveMemoryWarning = true
        super.didReceiveMemoryWarning()
    }

    public override func updateViewConstraints() {
        calledUpdateViewConstraints = true
        super.updateViewConstraints()
    }

    public override func addChildViewController(childController: UIKit.UIViewController) {
        calledAddChildViewController = true
        addedChildViewController = childController
        super.addChildViewController(childController)
    }

    public override func transitionFromViewController(fromViewController: UIKit.UIViewController, toViewController: UIKit.UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: UIViewAnimationsClosure?, completion: UIViewAnimationCompletionClosure?) {
        calledTransitionFromViewController = true
        viewControllerToTransitionFrom = fromViewController
        viewControllerToTransitionTo = toViewController
        transitionDuration = duration
        transitionAnimationOptions = options
        transitionAnimations = animations
        transitionCompletion = completion
        super.transitionFromViewController(fromViewController, toViewController: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    public override func removeFromParentViewController() {
        calledRemoveFromParentViewController = true
        super.removeFromParentViewController()
    }

    public override func setEditing(editing: Bool, animated: Bool) {
        calledSetEditing = true
        setEditingEditing = editing
        setEditingAnimated = animated
    }

    public override func encodeRestorableStateWithCoder(coder: NSCoder) {
        calledEncodeRestorableStateWithCoder = true
        encodeRestorableStateCoder = coder
        super.encodeRestorableStateWithCoder(coder)
    }

    public override func decodeRestorableStateWithCoder(coder: NSCoder) {
        calledDecodeRestorableStateWithCoder = true
        decodeRestorableStateCoder = coder
        super.decodeRestorableStateWithCoder(coder)
    }

}
