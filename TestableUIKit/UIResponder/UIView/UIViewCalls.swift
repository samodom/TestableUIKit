//
//  UIViewCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIView {

    public override func setNeedsLayout() {
        setNeedsLayoutCalled = true

        let selector = UIViewTestableSelectors.SetNeedsLayout
        if UIView.shouldForwardMethodCallWithSelector(selector) {
            super.setNeedsLayout()
        }
    }

    public override func invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true

        let selector = UIViewTestableSelectors.InvalidateIntrinsicContentSize
        if UIView.shouldForwardMethodCallWithSelector(selector) {
            super.invalidateIntrinsicContentSize()
        }
    }

    public override func setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true

        let selector = UIViewTestableSelectors.SetNeedsUpdateConstraints
        if UIView.shouldForwardMethodCallWithSelector(selector) {
            super.setNeedsUpdateConstraints()
        }
    }

    public override func setNeedsDisplay() {
        setNeedsDisplayCalled = true

        let selector = UIViewTestableSelectors.SetNeedsDisplay
        if UIView.shouldForwardMethodCallWithSelector(selector) {
            super.setNeedsDisplay()
        }
    }

    public override func setNeedsDisplayInRect(rect: CGRect) {
        setNeedsDisplayInRectCalled = true
        setNeedsDisplayInRectRect = rect

        let selector = UIViewTestableSelectors.SetNeedsDisplayInRect
        if UIView.shouldForwardMethodCallWithSelector(selector) {
            super.setNeedsDisplayInRect(rect)
        }
    }

}
