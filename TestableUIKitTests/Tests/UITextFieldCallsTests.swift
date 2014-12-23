//
//  UITextFieldCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UITextFieldCallsTests: XCTestCase {

    let textField = UITextField()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testForwardedBecomeFirstResponderCall() {
        XCTAssertFalse(textField.becomeFirstResponderCalled, "The text field should not indicate having been asked to become first responder by default")
        let accepted = textField.becomeFirstResponder()
        XCTAssertTrue(textField.becomeFirstResponderCalled, "The text field should now indicate having been asked to become first responder")
        XCTAssertFalse(accepted, "The default implementation of this class returns `true`, but this text field is not in a window")
    }

    func testUnforwardedBecomeFirstResponderCall() {
        textField.setShouldForwardMethodCallWithSelector("becomeFirstResponder", false)
        XCTAssertFalse(textField.becomeFirstResponderCalled, "The text field should not indicate having been asked to become first responder by default")
        let accepted = textField.becomeFirstResponder()
        XCTAssertTrue(textField.becomeFirstResponderCalled, "The text field should now indicate having been asked to become first responder")
        XCTAssertTrue(accepted, "The default implementation of this class returns `true`")
    }

    func testResignFirstResponderCall() {
        XCTAssertFalse(textField.resignFirstResponderCalled, "The text field should not indicate having been asked to resign first responder status by default")
        let resigned = textField.resignFirstResponder()
        XCTAssertTrue(textField.resignFirstResponderCalled, "The text field should now indicate having been asked to resign first responder status")
        XCTAssertFalse(resigned, "The default implementation of this class returns `true`, but this text field is not in a window")
    }

    func testUnforwardedResignFirstResponderCall() {
        textField.setShouldForwardMethodCallWithSelector("resignFirstResponder", false)
        XCTAssertFalse(textField.resignFirstResponderCalled, "The text field should not indicate having been asked to resign first responder status by default")
        let resigned = textField.resignFirstResponder()
        XCTAssertTrue(textField.resignFirstResponderCalled, "The text field should now indicate having been asked to resign first responder status")
        XCTAssertTrue(resigned, "The default implementation of this class returns `true`")
    }

}
