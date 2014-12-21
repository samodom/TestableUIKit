//
//  GoodViewControllerSubclass.swift
//  TestableApplication
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

internal class GoodViewControllerSubclass: GoodViewController {

    internal override func loadView() {
        view = UIView()
    }

    internal override func viewDidLoad() {
        super.viewDidLoad()
    }

    internal override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    internal override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    internal override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }

    internal override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    internal override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    internal override func addChildViewController(childController: UIKit.UIViewController) {
        super.addChildViewController(childController)
    }

    internal override func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    internal override func transitionFromViewController(fromViewController: UIKit.UIViewController, toViewController: UIKit.UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        super.transitionFromViewController(fromViewController, toViewController: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    internal override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    internal override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }

    internal override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }

    internal override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {

    }

    internal override func presentViewController(viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: (() -> ())?) {
        
    }

    internal override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {

    }

    internal override func showViewController(vc: UIKit.UIViewController, sender: AnyObject?) {

    }

}

