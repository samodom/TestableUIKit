//
//  UINavigationBarCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UINavigationBar {

    public override func pushNavigationItem(item: UINavigationItem, animated: Bool) {
        pushNavigationItemCalled = true
        pushNavigationItemNavigationItem = item
        pushNavigationItemAnimated = animated

        if shouldForwardMethodCallWithSelector("pushNavigationItem:animated:") {
            super.pushNavigationItem(item, animated: animated)
        }
    }

    public override func popNavigationItemAnimated(animated: Bool) -> UINavigationItem? {
        popNavigationItemCalled = true
        popNavigationItemAnimated = animated

        if shouldForwardMethodCallWithSelector("popNavigationItemAnimated:") {
            return super.popNavigationItemAnimated(animated)
        }
        else {
            return nil
        }
    }

    public override func setItems(items: [AnyObject]!, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items as? [UINavigationItem]
        setItemsAnimated = animated

        if shouldForwardMethodCallWithSelector("setItems:animated:") {
            super.setItems(items, animated: animated)
        }
    }
}

extension UINavigationBar: ShimMethodForwarding {

    /*!
        The UINavigationBar shim should forward spied messages by default.
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
