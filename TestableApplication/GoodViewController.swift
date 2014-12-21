//
//  GoodViewController.swift
//  TestableApplication
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

internal class GoodViewController: UIViewController {

    override internal func loadView() {
        view = UIView()
    }

    override internal func viewDidLoad() {
        super.viewDidLoad()
    }

    override internal func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override internal func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override internal func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override internal func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override internal func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override internal func updateViewConstraints() {
        super.updateViewConstraints()
    }

    override internal func addChildViewController(childController: UIKit.UIViewController) {
        super.addChildViewController(childController)
    }

    override internal func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    override internal func transitionFromViewController(fromViewController: UIKit.UIViewController, toViewController: UIKit.UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        super.transitionFromViewController(fromViewController, toViewController: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    override internal func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    override internal func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }

    override internal func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }

}

