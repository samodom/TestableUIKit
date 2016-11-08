//
//  UIViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIViewController {

    open override func performSegue(withIdentifier identifier: String, sender: Any?) {
        performSegueWithIdentifierCalled = true
        performSegueWithIdentifierSegueIdentifier = identifier
        performSegueWithIdentifierSender = sender as AnyObject?

        if shouldForwardMethodCallWithSelector(#selector(UIViewController.performSegue(withIdentifier:sender:))) {
            super.performSegue(withIdentifier: identifier, sender: sender)
        }
    }

    open override func present(_ viewControllerToPresent: UIKit.UIViewController, animated flag: Bool, completion: UIViewControllerPresentationCompletionClosure?) {
        presentViewControllerCalled = true
        self.viewControllerToPresent = viewControllerToPresent
        presentViewControllerAnimated = flag
        presentViewControllerCompletion = completion

        if shouldForwardMethodCallWithSelector(#selector(UIViewController.present(_:animated:completion:))) {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }

    open override func dismiss(animated flag: Bool, completion: UIViewControllerDismissalCompletionClosure?) {
        dismissViewControllerCalled = true
        dismissViewControllerAnimated = flag
        dismissViewControllerCompletion = completion

        if shouldForwardMethodCallWithSelector(#selector(UIViewController.dismiss(animated:completion:))) {
            super.dismiss(animated: flag, completion: completion)
        }
    }

    open override func show(_ viewController: UIKit.UIViewController, sender: Any?) {
        showViewControllerCalled = true
        viewControllerToShow = viewController
        showViewControllerSender = sender as AnyObject?

        if shouldForwardMethodCallWithSelector(#selector(UIViewController.show(_:sender:))) {
            super.show(viewController, sender: sender)
        }
    }

    open override func showDetailViewController(_ viewController: UIKit.UIViewController, sender: Any?) {
        showDetailViewControllerCalled = true
        detailViewControllerToShow = viewController
        showDetailViewControllerSender = sender as AnyObject?

        if shouldForwardMethodCallWithSelector(#selector(UIViewController.showDetailViewController(_:sender:))) {
            super.showDetailViewController(viewController, sender: sender)
        }
    }

}

extension TestableUIKit.UIViewController: ShimMethodForwarding {

    /*!
        The UIViewController shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(_ selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(_ selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
