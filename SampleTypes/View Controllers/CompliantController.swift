//
//  CompliantController.swift
//  TestableApplication
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class CompliantController: UIViewController {

    open override func loadView() {
        view = UIView()
    }

    public final var compliantControllerViewDidLoadCalled = false
    dynamic open override func viewDidLoad() {
        compliantControllerViewDidLoadCalled = true
        super.viewDidLoad()
    }

    public final var compliantControllerViewWillAppearCalled = false
    dynamic open override func viewWillAppear(_ animated: Bool) {
        compliantControllerViewWillAppearCalled = true
        super.viewWillAppear(animated)
    }

    public final var compliantControllerViewDidAppearCalled = false
    dynamic open override func viewDidAppear(_ animated: Bool) {
        compliantControllerViewDidAppearCalled = true
        super.viewDidAppear(animated)
    }

    public final var compliantControllerViewWillDisappearCalled = false
    dynamic open override func viewWillDisappear(_ animated: Bool) {
        compliantControllerViewWillDisappearCalled = true
        super.viewWillDisappear(animated)
    }

    public final var compliantControllerViewDidDisappearCalled = false
    dynamic open override func viewDidDisappear(_ animated: Bool) {
        compliantControllerViewDidDisappearCalled = true
        super.viewDidDisappear(animated)
    }

    public final var compliantControllerDidReceiveMemoryWarningCalled = false
    dynamic open override func didReceiveMemoryWarning() {
        compliantControllerDidReceiveMemoryWarningCalled = true
        super.didReceiveMemoryWarning()
    }

    public final var compliantControllerUpdateViewConstraintsCalled = false
    dynamic open override func updateViewConstraints() {
        compliantControllerUpdateViewConstraintsCalled = true
        super.updateViewConstraints()
    }

    dynamic open override func addChildViewController(_ controller: UIViewController) {
        super.addChildViewController(controller)
    }

    dynamic open override func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    public final var compliantControllerTransitionCalled = false
    dynamic open override func transition(
        from sourceController: UIViewController,
        to destinationController: UIViewController,
        duration: TimeInterval,
        options: UIViewAnimationOptions,
        animations: (() -> Void)?,
        completion: ((Bool) -> Void)?
        ) {

        compliantControllerTransitionCalled = true

        super.transition(
            from: sourceController,
            to: destinationController,
            duration: duration,
            options: options,
            animations: animations,
            completion: completion
        )
    }

    dynamic open override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    public final var compliantControllerEncodeRestorableStateCalled = false
    dynamic open override func encodeRestorableState(with coder: NSCoder) {
        compliantControllerEncodeRestorableStateCalled = true
        super.encodeRestorableState(with: coder)
    }

    public final var compliantControllerDecodeRestorableStateCalled = false
    dynamic open override func decodeRestorableState(with coder: NSCoder) {
        compliantControllerDecodeRestorableStateCalled = true
        super.decodeRestorableState(with: coder)
    }

    open override func performSegue(withIdentifier identifier: String?, sender: Any?) {}

    open override func present(
        _ controller: UIViewController,
        animated: Bool,
        completion: (() -> ())?
        ) {}

    open override func dismiss(animated: Bool, completion: (() -> Void)?) {}

    open override func show(_ controller: UIViewController, sender: Any?) {}

}

