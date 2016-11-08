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

    internal override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    internal override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    internal override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    internal override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    internal override func addChildViewController(_ childController: UIKit.UIViewController) {
        super.addChildViewController(childController)
    }

    internal override func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    internal override func transition(from fromViewController: UIKit.UIViewController, to toViewController: UIKit.UIViewController, duration: TimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        super.transition(from: fromViewController, to: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    internal override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    internal override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    internal override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

    internal override func performSegue(withIdentifier identifier: String?, sender: Any?) {

    }

    internal override func present(_ viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: (() -> ())?) {
        
    }

    internal override func dismiss(animated flag: Bool, completion: (() -> Void)?) {

    }

    internal override func show(_ vc: UIKit.UIViewController, sender: Any?) {

    }

}

