//
//  UIViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIView {

    open override func setNeedsLayout() {
        setNeedsLayoutCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIView.setNeedsLayout)) {
            super.setNeedsLayout()
        }
    }

    open override func invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIView.invalidateIntrinsicContentSize)) {
            super.invalidateIntrinsicContentSize()
        }
    }

    open override func setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true

        if shouldForwardMethodCallWithSelector(#selector(UIView.setNeedsUpdateConstraints)) {
            super.setNeedsUpdateConstraints()
        }
    }

    open override func setNeedsDisplay() {
        setNeedsDisplayCalled = true

        if shouldForwardMethodCallWithSelector(#selector(CALayer.setNeedsDisplay)) {
            super.setNeedsDisplay()
        }
    }

    open override func setNeedsDisplay(_ rect: CGRect) {
        setNeedsDisplayInRectCalled = true
        setNeedsDisplayInRectRect = rect

        if shouldForwardMethodCallWithSelector(#selector(UIView.setNeedsDisplay(_:))) {
            super.setNeedsDisplay(rect)
        }
    }

}

extension TestableUIKit.UIView: ShimMethodForwarding {

    /*!
        The UIView shim should forward spied messages by default.
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
