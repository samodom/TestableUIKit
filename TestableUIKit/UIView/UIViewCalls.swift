//
//  UIViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    public override func setNeedsLayout() {
        setNeedsLayoutCalled = true

        if shouldForwardMethodCallWithSelector("setNeedsLayout") {
            super.setNeedsLayout()
        }
    }

    public override func invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true

        if shouldForwardMethodCallWithSelector("invalidateIntrinsicContentSize") {
            super.invalidateIntrinsicContentSize()
        }
    }

    public override func setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true

        if shouldForwardMethodCallWithSelector("setNeedsUpdateConstraints") {
            super.setNeedsUpdateConstraints()
        }
    }

    public override func setNeedsDisplay() {
        setNeedsDisplayCalled = true

        if shouldForwardMethodCallWithSelector("setNeedsDisplay") {
            super.setNeedsDisplay()
        }
    }

    public override func setNeedsDisplayInRect(rect: CGRect) {
        setNeedsDisplayInRectCalled = true
        setNeedsDisplayInRectRect = rect

        if shouldForwardMethodCallWithSelector("setNeedsDisplayInRect:") {
            super.setNeedsDisplayInRect(rect)
        }
    }

}

extension UIView: ShimMethodForwarding {

    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return blockerList.shouldForwardMethodCallWithSelector(selector)
    }

    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        blockerList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
