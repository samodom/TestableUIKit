//
//  UIViewControllersSuperCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIViewController {

    open override func loadView() {
        calledLoadView = true
        super.loadView()
    }

    open override func viewDidLoad() {
        calledViewDidLoad = true
        super.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        calledViewWillAppear = true
        viewWillAppearAnimated = animated
        super.viewWillAppear(animated)
    }

    open override func viewDidAppear(_ animated: Bool) {
        calledViewDidAppear = true
        viewDidAppearAnimated = animated
        super.viewDidAppear(animated)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        calledViewWillDisappear = true
        viewWillDisappearAnimated = animated
        super.viewWillDisappear(animated)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        calledViewDidDisappear = true
        viewDidDisappearAnimated = animated
        super.viewDidDisappear(animated)
    }

    open override func didReceiveMemoryWarning() {
        calledDidReceiveMemoryWarning = true
        super.didReceiveMemoryWarning()
    }

    open override func updateViewConstraints() {
        calledUpdateViewConstraints = true
        super.updateViewConstraints()
    }

    open override func addChildViewController(_ childController: UIKit.UIViewController) {
        calledAddChildViewController = true
        addedChildViewController = childController
        super.addChildViewController(childController)
    }

    open override func transition(from fromViewController: UIKit.UIViewController, to toViewController: UIKit.UIViewController, duration: TimeInterval, options: UIViewAnimationOptions, animations: UIViewAnimationsClosure?, completion: UIViewAnimationCompletionClosure?) {
        calledTransitionFromViewController = true
        viewControllerToTransitionFrom = fromViewController
        viewControllerToTransitionTo = toViewController
        transitionDuration = duration
        transitionAnimationOptions = options
        transitionAnimations = animations
        transitionCompletion = completion
        super.transition(from: fromViewController, to: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    open override func removeFromParentViewController() {
        calledRemoveFromParentViewController = true
        super.removeFromParentViewController()
    }

    open override func setEditing(_ editing: Bool, animated: Bool) {
        calledSetEditing = true
        setEditingEditing = editing
        setEditingAnimated = animated
    }

    open override func encodeRestorableState(with coder: NSCoder) {
        calledEncodeRestorableStateWithCoder = true
        encodeRestorableStateCoder = coder
        super.encodeRestorableState(with: coder)
    }

    open override func decodeRestorableState(with coder: NSCoder) {
        calledDecodeRestorableStateWithCoder = true
        decodeRestorableStateCoder = coder
        super.decodeRestorableState(with: coder)
    }

}
