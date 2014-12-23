//
//  UINavigationController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UINavigationController {

    public override func pushViewController(viewController: UIKit.UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        pushViewControllerViewController = viewController
        pushViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector("pushViewController:animated:") {
            super.pushViewController(viewController, animated: animated)
        }
    }

    public override func popViewControllerAnimated(animated: Bool) -> UIKit.UIViewController? {
        popViewControllerCalled = true
        popViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector("popViewControllerAnimated:") {
            return super.popViewControllerAnimated(animated)
        }
        else {
            return nil
        }
    }

    public override func popToRootViewControllerAnimated(animated: Bool) -> [AnyObject]? {
        popToRootViewControllerCalled = true
        popToRootViewControllerAnimated = animated

        if shouldForwardMethodCallWithSelector("popToRootViewControllerAnimated:") {
            return super.popToRootViewControllerAnimated(animated)
        }
        else {
            return nil
        }
    }

    public override func popToViewController(viewController: UIKit.UIViewController, animated: Bool) -> [AnyObject]? {
        popToViewControllerCalled = true
        popToViewControllerAnimated = animated
        popToViewControllerViewController = viewController

        if shouldForwardMethodCallWithSelector("popToViewController:animated:") {
            return super.popToViewController(viewController, animated: animated)
        }
        else {
            return nil
        }
    }

}

extension UINavigationController: ShimMethodForwarding {

    /**
      The UINavigationController shim should forward spied messages by default.
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
