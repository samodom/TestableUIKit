//
//  UIViewDirectSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestSwagger
import TestableUIKit


class TestView: UIView {

    var setNeedsLayoutTestMethodCalled = false
    dynamic override func setNeedsLayout() {
        setNeedsLayoutTestMethodCalled = true
    }

    var invalidateIntrinsicContentSizeTestMethodCalled = false
    dynamic override func invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeTestMethodCalled = true
    }

    var setNeedsUpdateConstraintsTestMethodCalled = false
    dynamic override func setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsTestMethodCalled = true
    }

    var setNeedsDisplayNullaryTestMethodCalled = false
    dynamic override func setNeedsDisplay() {
        setNeedsDisplayNullaryTestMethodCalled = true
    }

    var setNeedsDisplayUnaryTestMethodCalled = false
    dynamic override func setNeedsDisplay(_ rect: CGRect) {
        setNeedsDisplayUnaryTestMethodCalled = true
    }

}

class UIViewDirectSpiesTests: XCTestCase {

    let rootView = UIApplication.rootView
    let testView = TestView()

    override func setUp() {
        super.setUp()

        rootView.addSubview(testView)
    }

    override func tearDown() {
        testView.removeFromSuperview()

        super.tearDown()
    }


    // MARK: - `setNeedsLayout`

    func testSetNeedsLayoutControllerForwardingBehavior() {
        XCTAssertEqual(UIView.SetNeedsLayoutSpyController.forwardingBehavior, .always,
                       "Spies on `setNeedsLayout` should always forward their method invocations")
    }

    func testSetNeedsLayoutSpyOffMainThread() {
        testView.setNeedsLayoutTestMethodCalled = false
        XCTAssertFalse(testView.setNeedsLayoutCalled,
                       "By default the view should not indicate having been told that it needs layout")
        XCTAssertFalse(testView.setNeedsLayoutCalledOnMainThread,
                       "By default the main thread flag should be false")

        let testPerformed = expectation(description: "test performed")

        DispatchQueue.global(qos: .background).async { [testView] in
            assert(!Thread.isMainThread)

            let spy = UIView.SetNeedsLayoutSpyController.createSpy(on: testView)!
            spy.beginSpying()

            testView.setNeedsLayout()
            XCTAssertTrue(testView.setNeedsLayoutCalled,
                          "A view being spied upon should indicate having had `setNeedsLayout` called on it")
            XCTAssertFalse(testView.setNeedsLayoutCalledOnMainThread,
                           "A view being spied upon should indicate whether `setNeedsLayout` was called on the main thread")
            XCTAssertTrue(testView.setNeedsLayoutTestMethodCalled,
                          "The spy method should always forward the method call to the original implementation")

            spy.endSpying()

            testPerformed.fulfill()
        }

        waitForExpectations(timeout: 1) { [testView] _ in
            XCTAssertFalse(testView.setNeedsLayoutCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testSetNeedsLayoutSpyOnMainThread() {
        testView.setNeedsLayoutTestMethodCalled = false
        XCTAssertFalse(testView.setNeedsLayoutCalled,
                       "By default the view should not indicate having been told that it needs layout")
        XCTAssertFalse(testView.setNeedsLayoutCalledOnMainThread,
                       "By default the main thread flag should be false")

        let testPerformed = expectation(description: "test performed")

        DispatchQueue.global(qos: .userInitiated).sync { [testView] in
            assert(Thread.isMainThread)

            let spy = UIView.SetNeedsLayoutSpyController.createSpy(on: testView)!
            spy.beginSpying()

            testView.setNeedsLayout()
            XCTAssertTrue(testView.setNeedsLayoutCalled,
                          "A view being spied upon should indicate having had `setNeedsLayout` called on it")
            XCTAssertTrue(testView.setNeedsLayoutCalledOnMainThread,
                          "A view being spied upon should indicate whether `setNeedsLayout` was called on the main thread")
            XCTAssertTrue(testView.setNeedsLayoutTestMethodCalled,
                          "The spy method should always forward the method call to the original implementation")

            spy.endSpying()

            testPerformed.fulfill()
        }

        waitForExpectations(timeout: 1) { [testView] _ in
            XCTAssertFalse(testView.setNeedsLayoutCalled,
                           "The flag should be cleared after spying is complete")
        }
    }


    // MARK: - `invalidateIntrinsicContentSize`

    func testInvalidateIntrinsicContentSizeControllerForwardingBehavior() {
        XCTAssertEqual(UIView.InvalidateIntrinsicContentSizeSpyController.forwardingBehavior, .always,
                       "Spies on `invalidateIntrinsicContentSize` should always forward their method invocations")
    }


    func testInvalidateIntrinsicContentSizeSpy() {
        testView.invalidateIntrinsicContentSizeTestMethodCalled = false
        XCTAssertFalse(testView.invalidateIntrinsicContentSizeCalled,
                       "By default the view should not indicate having been told to invalidate its intrinsic content size")

        let spy = UIView.InvalidateIntrinsicContentSizeSpyController.createSpy(on: testView)!
        spy.beginSpying()

        testView.invalidateIntrinsicContentSize()
        XCTAssertTrue(testView.invalidateIntrinsicContentSizeCalled,
                      "A view being spied upon should indicate having had `invalidateIntrinsicContentSize` called on it")
        XCTAssertTrue(testView.invalidateIntrinsicContentSizeTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testView.invalidateIntrinsicContentSizeCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `setNeedsUpdateConstraints`

    func testSetNeedsUpdateConstraintsControllerForwardingBehavior() {
        XCTAssertEqual(UIView.SetNeedsUpdateConstraintsSpyController.forwardingBehavior, .always,
                       "Spies on `setNeedsUpdateConstraints` should always forward their method invocations")
    }

    func testSetNeedsUpdateConstraintsSpyOffMainThread() {
        testView.setNeedsUpdateConstraintsTestMethodCalled = false
        XCTAssertFalse(testView.setNeedsUpdateConstraintsCalled,
                       "By default the view should not indicate having been told that it needs to update its constraints")

        let spy = UIView.SetNeedsUpdateConstraintsSpyController.createSpy(on: testView)!
        spy.beginSpying()

        testView.setNeedsUpdateConstraints()
        XCTAssertTrue(testView.setNeedsUpdateConstraintsCalled,
                      "A view being spied upon should indicate having had `setNeedsUpdateConstraints` called on it")
        XCTAssertTrue(testView.setNeedsUpdateConstraintsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testView.setNeedsUpdateConstraintsCalled,
                       "The flag should be cleared after spying is complete")
    }

    // MARK: - `setNeedsDisplay` and `setNeedsDisplay(_:)`

    func testSetNeedsDisplayControllerForwardingBehavior() {
        XCTAssertEqual(UIView.SetNeedsDisplaySpyController.forwardingBehavior, .always,
                       "Spies on `setNeedsDisplay` and `setNeedsDisplay(_:)` should always forward their method invocations")
    }

    func testNullarySetNeedsDisplaySpy() {
        testView.setNeedsDisplayNullaryTestMethodCalled = false
        XCTAssertFalse(testView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs layout")

        let spy = UIView.SetNeedsDisplaySpyController.createSpy(on: testView)!
        spy.beginSpying()

        testView.setNeedsDisplay()
        XCTAssertTrue(testView.setNeedsDisplayCalled,
                      "A view being spied upon should indicate having had `setNeedsDisplay` called on it")
        XCTAssertTrue(testView.setNeedsDisplayNullaryTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testView.setNeedsDisplayCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testUnarySetNeedsDisplaySpy() {
        testView.setNeedsDisplayUnaryTestMethodCalled = false
        XCTAssertFalse(testView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs layout")
        XCTAssertNil(testView.setNeedsDisplayRect, "By default there should be no captured rect")

        let spy = UIView.SetNeedsDisplaySpyController.createSpy(on: testView)!
        spy.beginSpying()

        let rect = CGRect(x: 14, y: 42, width: 99, height: 44)
        testView.setNeedsDisplay(rect)
        XCTAssertTrue(testView.setNeedsDisplayCalled,
                      "A view being spied upon should indicate having had `setNeedsDisplay` called on it")
        XCTAssertEqual(testView.setNeedsDisplayRect, rect,
                       "The rect passed to the method should be captured")
        XCTAssertTrue(testView.setNeedsDisplayUnaryTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testView.setNeedsDisplayCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(testView.setNeedsDisplayRect,
                     "The rect should be cleared after spying is complete")
    }

}
