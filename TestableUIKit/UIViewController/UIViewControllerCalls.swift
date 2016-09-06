//
//  UIViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIViewController {

    public override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        performSegueWithIdentifierCalled = true
        performSegueWithIdentifierSegueIdentifier = identifier
        performSegueWithIdentifierSender = sender

        let selector = UIViewControllerTestableSelectors.PerformSegue
        if UIViewController.shouldForwardMethodCallWithSelector(selector) {
            super.performSegueWithIdentifier(identifier, sender: sender)
        }
    }

    public override func presentViewController(viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: UIViewControllerPresentationCompletionHandler?) {
        presentViewControllerCalled = true
        self.viewControllerToPresent = viewControllerToPresent
        presentViewControllerAnimated = flag
        presentViewControllerCompletion = completion

        let selector = UIViewControllerTestableSelectors.PresentViewController
        if UIViewController.shouldForwardMethodCallWithSelector(selector) {
            super.presentViewController(viewControllerToPresent, animated: flag, completion: completion)
        }
    }

    public override func dismissViewControllerAnimated(flag: Bool, completion: UIViewControllerDismissalCompletionHandler?) {
        dismissViewControllerCalled = true
        dismissViewControllerAnimated = flag
        dismissViewControllerCompletion = completion

        let selector = UIViewControllerTestableSelectors.DismissViewController
        if UIViewController.shouldForwardMethodCallWithSelector(selector) {
            super.dismissViewControllerAnimated(flag, completion: completion)
        }
    }

    public override func showViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showViewControllerCalled = true
        viewControllerToShow = viewController
        showViewControllerSender = sender

        let selector = UIViewControllerTestableSelectors.ShowViewController
        if UIViewController.shouldForwardMethodCallWithSelector(selector) {
            super.showViewController(viewController, sender: sender)
        }
    }

    public override func showDetailViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showDetailViewControllerCalled = true
        detailViewControllerToShow = viewController
        showDetailViewControllerSender = sender

        let selector = UIViewControllerTestableSelectors.ShowDetailViewController
        if UIViewController.shouldForwardMethodCallWithSelector(selector) {
            super.showDetailViewController(viewController, sender: sender)
        }
    }

}
