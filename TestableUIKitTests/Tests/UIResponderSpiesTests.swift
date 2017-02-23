//
//  UIResponderSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit
import FoundationSwagger

class UIResponderSpiesTests: XCTestCase {

    let textField = UITextField()
    var responder = UIResponder()

    override func setUp() {
        super.setUp()

        UIApplication.rootView.addSubview(textField)
    }

    override func tearDown() {
        textField.removeFromSuperview()

        super.tearDown()
    }


    // MARK: - `becomeFirstResponder`

    func testBecomeFirstResponderControllerForwardingBehavior() {
        XCTAssertEqual(UIResponder.BecomeFirstResponderSpyController.forwardingBehavior, .always,
                       "Spies on `becomeFirstResponder` should always forward their method invocations")
    }

    func testSpyingOnBecomeFirstResponder() {
        responder = textField
        let spy = UIResponder.BecomeFirstResponderSpyController.createSpy(on: responder)!

        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "By default the responder should not indicate having been asked to become the first responder")

        spy.beginSpying()

        XCTAssertTrue(responder.becomeFirstResponder(),
                      "The method call should be forwarded to the original implementation")
        XCTAssertTrue(responder.becomeFirstResponderCalled,
                      "The responder should indicate having been asked to become the first responder")
        XCTAssertTrue(responder.isFirstResponder,
                      "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `resignFirstResponder`

    func testResignFirstResponderControllerForwardingBehavior() {
        XCTAssertEqual(UIResponder.ResignFirstResponderSpyController.forwardingBehavior, .always,
                       "Spies on `resignFirstResponder` should always forward their method invocations")
    }

    func testSpyingOnResignFirstResponder() {
        responder = textField
        let spy = UIResponder.ResignFirstResponderSpyController.createSpy(on: responder)!

        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "By default the responder should not indicate having been asked to resign first responder status")

        spy.beginSpying()

        responder.becomeFirstResponder()

        XCTAssertTrue(responder.resignFirstResponder(),
                      "The method call should be forwarded to the original implementation")
        XCTAssertTrue(responder.resignFirstResponderCalled,
                      "The responder should indicate having been asked to resign first responder status")
        XCTAssertFalse(responder.isFirstResponder,
                       "The spy method should forward the invocation to the original method")

        spy.endSpying()

        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }

}
