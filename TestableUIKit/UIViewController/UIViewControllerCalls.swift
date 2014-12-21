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

        if shouldForwardMethodCallWithSelector("performSegueWithIdentifier:sender:") {
            super.performSegueWithIdentifier(identifier, sender: sender)
        }
    }

    public override func presentViewController(viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: UIViewControllerPresentationCompletionClosure?) {
        presentViewControllerCalled = true
        self.viewControllerToPresent = viewControllerToPresent
        presentViewControllerAnimated = flag
        presentViewControllerCompletion = completion

        if shouldForwardMethodCallWithSelector("presentViewController:animated:completion:") {
            super.presentViewController(viewControllerToPresent, animated: flag, completion: completion)
        }
    }

    public override func dismissViewControllerAnimated(flag: Bool, completion: UIViewControllerDismissalCompletionClosure?) {
        dismissViewControllerCalled = true
        dismissViewControllerAnimated = flag
        dismissViewControllerCompletion = completion

        if shouldForwardMethodCallWithSelector("dismissViewControllerAnimated:completion:") {
            super.dismissViewControllerAnimated(flag, completion: completion)
        }
    }

    public override func showViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showViewControllerCalled = true
        viewControllerToShow = viewController
        showViewControllerSender = sender

        if shouldForwardMethodCallWithSelector("showViewController:sender:") {
            super.showViewController(viewController, sender: sender)
        }
    }

    public override func showDetailViewController(viewController: UIKit.UIViewController, sender: AnyObject?) {
        showDetailViewControllerCalled = true
        detailViewControllerToShow = viewController
        showDetailViewControllerSender = sender

        if shouldForwardMethodCallWithSelector("showDetailViewController:sender:") {
            super.showDetailViewController(viewController, sender: sender)
        }
    }

}

extension UIViewController: ShimMethodForwarding {

    /**
      The UIViewController shim should not forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /**
      This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method to check for forwarding status.
      @return       Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /**
      Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method of which to change the forwarding status.
      @param        Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
