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
    }

    public override func invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true
    }

    public override func setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true
    }

    public override func setNeedsDisplay() {
        setNeedsDisplayCalled = true
    }

    public override func setNeedsDisplayInRect(rect: CGRect) {
        setNeedsDisplayInRectCalled = true
        setNeedsDisplayInRectRect = rect
    }

}
