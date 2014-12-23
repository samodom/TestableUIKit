//
//  UIResponderCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIResponderCallsTests: XCTestCase {

    let responder = UIResponder()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testForwardedBecomeFirstResponderCall() {
        XCTAssertFalse(responder.becomeFirstResponderCalled, "The responder should not indicate having been asked to become first responder by default")
        let accepted = responder.becomeFirstResponder()
        XCTAssertTrue(responder.becomeFirstResponderCalled, "The responder should now indicate having been asked to become first responder")
        XCTAssertFalse(accepted, "The default implementation of this class returns `true`, but this responder is not in a window")
    }

    func testUnforwardedBecomeFirstResponderCall() {
        responder.setShouldForwardMethodCallWithSelector("becomeFirstResponder", false)
        XCTAssertFalse(responder.becomeFirstResponderCalled, "The responder should not indicate having been asked to become first responder by default")
        let accepted = responder.becomeFirstResponder()
        XCTAssertTrue(responder.becomeFirstResponderCalled, "The responder should now indicate having been asked to become first responder")
        XCTAssertTrue(accepted, "The default implementation of this class returns `true`")
    }

    func testForwardedResignFirstResponderCall() {
        XCTAssertFalse(responder.resignFirstResponderCalled, "The responder should not indicate having been asked to resign first responder status by default")
        let resigned = responder.resignFirstResponder()
        XCTAssertTrue(responder.resignFirstResponderCalled, "The responder should now indicate having been asked to resign first responder status")
        XCTAssertFalse(resigned, "The default implementation of this class returns `true`, but this responder is not in a window")
    }

    func testUnforwardedResignFirstResponderCall() {
        responder.setShouldForwardMethodCallWithSelector("resignFirstResponder", false)
        XCTAssertFalse(responder.resignFirstResponderCalled, "The responder should not indicate having been asked to resign first responder status by default")
        let resigned = responder.resignFirstResponder()
        XCTAssertTrue(responder.resignFirstResponderCalled, "The responder should now indicate having been asked to resign first responder status")
        XCTAssertTrue(resigned, "The default implementation of this class returns `true`")
    }

}
