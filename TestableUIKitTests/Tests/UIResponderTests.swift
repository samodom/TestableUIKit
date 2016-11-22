//
//  UIResponderTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit
import FoundationSwagger

class UIResponderTests: SpyTestCase {

    let textField = UITextField()
    var responder = UIResponder()

    override func setUp() {
        super.setUp()

        UIApplication.rootView.addSubview(textField)
    }

    override func tearDown() {
        textField.removeFromSuperview()
        association?.useOriginalImplementation()

        super.tearDown()
    }


    func testDefaultMethodCallForwarding() {
        XCTAssertTrue(responder.forwardsMethodCallsByDefault,
                      "By default this spy should forward method calls")
        XCTAssertTrue(responder.forwardsMethodCalls(forSelector: UIResponder.SpyAssociations.becomeFirstResponder.originalSelector),
                      "By default `UIResponder` should forward spied calls to `becomeFirstResponder`")
        XCTAssertTrue(responder.forwardsMethodCalls(forSelector: UIResponder.SpyAssociations.resignFirstResponder.originalSelector),
                      "By default `UIResponder` should forward spied calls to `resignFirstResponder`")
    }


    //  MARK: - `becomeFirstResponder`

    func testSpyingOnBecomeFirstResponderWithContext() {
        association = UIResponder.SpyAssociations.becomeFirstResponder
        inspectImplementations(forAssociation: association)
        responder = textField

        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "By default the responder should not indicate having been asked to become the first responder")

        responder.spyOnBecomeFirstResponder {
            contextExecuted = true
            validateMethodsAreSwizzled()

            var returnValue = responder.becomeFirstResponder()
            XCTAssertTrue(responder.becomeFirstResponderCalled,
                          "The responder should indicate having been asked to become the first responder")
            XCTAssertTrue(returnValue,
                          "The method call should be forwarded to the original implementation")

            responder.addMethodCallForwardingException(forSelector: association.originalSelector)
            returnValue = responder.becomeFirstResponder()
            XCTAssertTrue(returnValue, "The unforwarded method call should return the default value")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testSpyingOnBecomeFirstResponderWithoutContext() {
        association = UIResponder.SpyAssociations.becomeFirstResponder
        inspectImplementations(forAssociation: association)
        responder = textField

        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "By default the responder should not indicate having been asked to become the first responder")

        responder.beginSpyingOnBecomeFirstResponder()
        validateMethodsAreSwizzled()

        var returnValue = responder.becomeFirstResponder()
        XCTAssertTrue(responder.becomeFirstResponderCalled,
                      "The responder should indicate having been asked to become the first responder")
        XCTAssertTrue(returnValue,
                      "The method call should be forwarded to the original implementation")

        responder.addMethodCallForwardingException(forSelector: association.originalSelector)
        returnValue = responder.becomeFirstResponder()
        XCTAssertTrue(returnValue, "The unforwarded method call should return the default value")

        responder.endSpyingOnBecomeFirstResponder()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(responder.becomeFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `resignFirstResponder`

    func testSpyingOnResignFirstResponderWithContext() {
        association = UIResponder.SpyAssociations.resignFirstResponder
        inspectImplementations(forAssociation: association)
        responder = textField

        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "By default the responder should not indicate having been asked to resign first responder status")

        responder.spyOnResignFirstResponder {
            contextExecuted = true
            validateMethodsAreSwizzled()

            responder.becomeFirstResponder()
            var returnValue = responder.resignFirstResponder()
            XCTAssertTrue(responder.resignFirstResponderCalled,
                          "The responder should indicate having been asked to resign first responder status")
            XCTAssertTrue(returnValue,
                          "The method call should be forwarded to the original implementation")

            responder.addMethodCallForwardingException(forSelector: association.originalSelector)
            returnValue = responder.resignFirstResponder()
            XCTAssertTrue(returnValue, "The unforwarded method call should return the default value")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testSpyingOnResignFirstResponderWithoutContext() {
        association = UIResponder.SpyAssociations.resignFirstResponder
        inspectImplementations(forAssociation: association)
        responder = textField

        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "By default the responder should not indicate having been asked to resign first responder status")

        responder.beginSpyingOnResignFirstResponder()
        validateMethodsAreSwizzled()

        responder.becomeFirstResponder()
        var returnValue = responder.resignFirstResponder()
        XCTAssertTrue(responder.resignFirstResponderCalled,
                      "The responder should indicate having been asked to resign first responder status")
        XCTAssertTrue(returnValue,
                      "The method call should be forwarded to the original implementation")

        responder.addMethodCallForwardingException(forSelector: association.originalSelector)
        returnValue = responder.resignFirstResponder()
        XCTAssertTrue(returnValue, "The unforwarded method call should return the default value")

        responder.endSpyingOnResignFirstResponder()

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(responder.resignFirstResponderCalled,
                       "The flag should be cleared after spying is complete")
    }

}
