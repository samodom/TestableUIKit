//
//  MethodCallFowardingTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/21/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit
import SampleTypes

class MethodCallForwardingTests: XCTestCase {

    let selector = #selector(NSObject.isSubclass(of:))
    let defaultForwardingObject = NSObject()
    let customForwardingObject = CustomForwardingObject()

    func testDefaultForwarding() {
        XCTAssertTrue(defaultForwardingObject.forwardsMethodCallsByDefault,
                      "Objects should intend to forward swizzled method calls by default")
        XCTAssertTrue(defaultForwardingObject.forwardsMethodCalls(forSelector: selector),
                      "Objects should intend to forward swizzled method calls by default")
    }

    func testForwardingByDefault() {
        customForwardingObject.forwardsMethodCallsByDefault = true
        XCTAssertTrue(customForwardingObject.forwardsMethodCallsByDefault,
                      "This object should intend to forward swizzled method calls by default")
        XCTAssertTrue(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                      "This object should intend to forward swizzled method calls by default")
    }

    func testNotForwardingByDefault() {
        customForwardingObject.forwardsMethodCallsByDefault = false
        XCTAssertFalse(customForwardingObject.forwardsMethodCallsByDefault,
                       "This object should not intend to forward swizzled method calls by default")
        XCTAssertFalse(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                       "This object should not intend to forward swizzled method calls by default")
    }

    func testExceptionsWithDefaultForwarding() {
        customForwardingObject.forwardsMethodCallsByDefault = true

        customForwardingObject.addMethodCallForwardingException(forSelector: selector)
        XCTAssertFalse(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                       "The selector should not be forwarded since it is an exception")

        customForwardingObject.removeMethodCallForwardingException(forSelector: selector)
        XCTAssertTrue(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                      "The selector should now be forwarded again")
    }

    func testExceptionsWithoutDefaultForwarding() {
        customForwardingObject.forwardsMethodCallsByDefault = false

        customForwardingObject.addMethodCallForwardingException(forSelector: selector)
        XCTAssertTrue(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                      "The selector should be forwarded since it is an exception")

        customForwardingObject.removeMethodCallForwardingException(forSelector: selector)
        XCTAssertFalse(customForwardingObject.forwardsMethodCalls(forSelector: selector),
                       "The selector should no longer be forwarded")
    }

}
