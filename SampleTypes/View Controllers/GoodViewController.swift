//
//  GoodViewController.swift
//  TestableApplication
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class GoodViewController: UIViewController {

    public override func loadView() {
        view = UIView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public override func updateViewConstraints() {
        super.updateViewConstraints()
    }

    public override func addChildViewController(_ childController: UIKit.UIViewController) {
        super.addChildViewController(childController)
    }

    public override func removeFromParentViewController() {
        super.removeFromParentViewController()
    }

    public override func transition(from fromViewController: UIKit.UIViewController, to toViewController: UIKit.UIViewController, duration: TimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        super.transition(from: fromViewController, to: toViewController, duration: duration, options: options, animations: animations, completion: completion)
    }

    public override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    public override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    public override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

    public override func performSegue(withIdentifier identifier: String?, sender: Any?) {

    }

    public override func present(_ viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: (() -> ())?) {

    }

    public override func dismiss(animated flag: Bool, completion: (() -> Void)?) {

    }

    public override func show(_ vc: UIKit.UIViewController, sender: Any?) {

    }

}

