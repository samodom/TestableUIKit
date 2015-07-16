//
//  UITabBarController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UITabBarController {

    public override func setViewControllers(viewControllers: [UIKit.UIViewController]?, animated: Bool) {
        setViewControllersCalled = true
        setViewControllersViewControllers = viewControllers
        setViewControllersAnimated = animated

        if shouldForwardMethodCallWithSelector("setViewControllers:animated:") {
            super.setViewControllers(viewControllers, animated: animated)
        }
    }

}

extension TestableUIKit.UITabBarController: ShimMethodForwarding {

    /*!
        The UITabBarController shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
