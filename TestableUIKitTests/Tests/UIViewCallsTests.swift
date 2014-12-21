//
//  UIViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIViewCallsTests: XCTestCase {

    let customView = GoodView()
    let subView = GoodViewSubclass()
    let plainView = UIView()
    let emptyView = EmptyView()
    var capturedViews: [UIView]!

    override func setUp() {
        super.setUp()

        capturedViews = [customView, subView, plainView, emptyView]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewShimForwarding() {
        let view = UIView()
        XCTAssertTrue(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        view.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should be registered to be blocked from forwarding")
        view.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be registered to be blocked from forwarding")
    }

    func testSetNeedsLayoutCall() {
        for view in capturedViews {
            XCTAssertFalse(view.setNeedsLayoutCalled, "The view should not indicate having had setNeedsLayout called by default")
            view.setNeedsLayout()
            XCTAssertTrue(view.setNeedsLayoutCalled, "The view should now indicate having had setNeedsLayout called by default")
        }
    }

    func testInvalidateIntrinsicContentSizeCall() {
        for view in capturedViews {
            XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled, "The view should not indicate having had invalidateIntrinsicContentSize called by default")
            view.invalidateIntrinsicContentSize()
            XCTAssertTrue(view.invalidateIntrinsicContentSizeCalled, "The view should now indicate having had invalidateIntrinsicContentSize called by default")
        }
    }

    func testSetNeedsUpdateConstraintsCall() {
        for view in capturedViews {
            XCTAssertFalse(view.setNeedsUpdateConstraintsCalled, "The view should not indicate having had setNeedsUpdateConstraints called by default")
            view.setNeedsUpdateConstraints()
            XCTAssertTrue(view.setNeedsUpdateConstraintsCalled, "The view should now indicate having had setNeedsUpdateConstraints called by default")
        }
    }

    func testSetNeedsDisplayCall() {
        for view in capturedViews {
            view.setNeedsDisplayCalled = false
            view.setNeedsDisplay()
            XCTAssertTrue(view.setNeedsDisplayCalled, "The view should now indicate having had setNeedsDisplay called by default")
        }
    }

    func testSetNeedsDisplayInRectCall() {
        for view in capturedViews {
            XCTAssertFalse(view.setNeedsDisplayInRectCalled, "The view should not indicate having had setNeedsDisplayInRect called by default")
            XCTAssertTrue(view.setNeedsDisplayInRectRect == nil, "The rect should be missing by default")

            let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
            view.setNeedsDisplayInRect(rect)
            XCTAssertTrue(view.setNeedsDisplayInRectCalled, "The view should now indicate having had setNeedsDisplayInRect called by default")
            XCTAssertEqual(view.setNeedsDisplayInRectRect!, rect, "The rect should be captured")
        }
    }

}
