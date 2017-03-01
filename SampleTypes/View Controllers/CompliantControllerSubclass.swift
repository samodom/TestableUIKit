//
//  CompliantControllerSubclass.swift
//  TestableApplication
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class CompliantControllerSubclass: CompliantController {

    public final var compliantControllerSubclassLoadViewCalled = false
    open override func loadView() {
        compliantControllerSubclassLoadViewCalled = true
        view = UIView()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    open override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    open override func addChildViewController(_ controller: UIViewController) {
        super.addChildViewController(controller)
    }

    open override func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    open override func transition(
        from sourceController: UIViewController,
        to destinationController: UIViewController,
        duration: TimeInterval,
        options: UIViewAnimationOptions,
        animations: (() -> Void)?,
        completion: ((Bool) -> Void)?
        ) {

        super.transition(
            from: sourceController,
            to: destinationController,
            duration: duration,
            options: options,
            animations: animations,
            completion: completion
        )
    }

    open override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    open override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    open override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

    open override func performSegue(withIdentifier identifier: String?, sender: Any?) {}

    open override func present(
        _ viewControllerToPresent: UIViewController,
        animated: Bool,
        completion: (() -> ())?
        ) {}

    open override func dismiss(animated: Bool, completion: (() -> Void)?) {}

    open override func show(_ controller: UIViewController, sender: Any?) {}

}

