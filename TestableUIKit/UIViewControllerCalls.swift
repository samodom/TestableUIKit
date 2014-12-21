//
//  UIViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIViewController {

    public override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
        performSegueWithIdentifierCalled = true
        performSegueWithIdentifierSegueIdentifier = identifier
        performSegueWithIdentifierSender = sender
    }

    public override func presentViewController(viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: UIViewControllerPresentationCompletionClosure?) {
        presentViewControllerCalled = true
        self.viewControllerToPresent = viewControllerToPresent
        presentViewControllerAnimated = flag
        presentViewControllerCompletion = completion
    }

    public override func dismissViewControllerAnimated(flag: Bool, completion: UIViewControllerDismissalCompletionClosure?) {
        dismissViewControllerCalled = true
        dismissViewControllerAnimated = flag
        dismissViewControllerCompletion = completion
    }

    public override func showViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showViewControllerCalled = true
        viewControllerToShow = viewController
        showViewControllerSender = sender
    }

    public override func showDetailViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showDetailViewControllerCalled = true
        detailViewControllerToShow = viewController
        showDetailViewControllerSender = sender
    }

}
