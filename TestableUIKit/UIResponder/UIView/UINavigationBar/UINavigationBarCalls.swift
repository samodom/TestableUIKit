//
//  UINavigationBarCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UINavigationBar {

    open override func pushItem(_ item: UINavigationItem, animated: Bool) {
        pushNavigationItemCalled = true
        pushNavigationItemNavigationItem = item
        pushNavigationItemAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationBar.pushItem(_:animated:))) {
            super.pushItem(item, animated: animated)
        }
    }

    open override func popItem(animated: Bool) -> UINavigationItem? {
        popNavigationItemCalled = true
        popNavigationItemAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationBar.popItem(animated:))) {
            return super.popItem(animated: animated)
        }
        else {
            return nil
        }
    }

    open override func setItems(_ items: [UINavigationItem]!, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        if shouldForwardMethodCallWithSelector(#selector(UINavigationBar.setItems(_:animated:))) {
            super.setItems(items, animated: animated)
        }
    }
}

extension TestableUIKit.UINavigationBar: ShimMethodForwarding {

    /*!
        The UINavigationBar shim should forward spied messages by default.
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
