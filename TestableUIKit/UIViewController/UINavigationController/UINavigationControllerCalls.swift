//
//  UINavigationController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UINavigationController {

    open override func pushViewController(_ viewController: UIKit.UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        pushViewControllerViewController = viewController
        pushViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationController.pushViewController(_:animated:))) {
            super.pushViewController(viewController, animated: animated)
        }
    }

    open override func popViewController(animated: Bool) -> UIKit.UIViewController? {
        popViewControllerCalled = true
        popViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationController.popViewController(animated:))) {
            return super.popViewController(animated: animated)
        }
        else {
            return nil
        }
    }

    open override func popToRootViewController(animated: Bool) -> [UIKit.UIViewController]? {
        popToRootViewControllerCalled = true
        popToRootViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationController.popToRootViewController(animated:))) {
            return super.popToRootViewController(animated: animated)
        }
        else {
            return nil
        }
    }

    open override func popToViewController(_ viewController: UIKit.UIViewController, animated: Bool) -> [UIKit.UIViewController]? {
        popToViewControllerCalled = true
        popToViewControllerAnimated = animated
        popToViewControllerViewController = viewController

        if shouldForwardMethodCallWithSelector(#selector(UINavigationController.popToViewController(_:animated:))) {
            return super.popToViewController(viewController, animated: animated)
        }
        else {
            return nil
        }
    }

}

extension UINavigationController: ShimMethodForwarding {

    /*!
        The UINavigationController shim should forward spied messages by default.
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
