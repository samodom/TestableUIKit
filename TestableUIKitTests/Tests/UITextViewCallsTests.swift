//
//  UITextViewCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UITextViewCallsTests: XCTestCase {

    let textView = UITextView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testForwardedBecomeFirstResponderCall() {
        XCTAssertFalse(textView.becomeFirstResponderCalled, "The text view should not indicate having been asked to become first responder by default")
        let accepted = textView.becomeFirstResponder()
        XCTAssertTrue(textView.becomeFirstResponderCalled, "The text view should now indicate having been asked to become first responder")
        XCTAssertFalse(accepted, "The default implementation of this class returns `true`, but this text view is not in a window")
    }

    func testUnforwardedBecomeFirstResponderCall() {
        textView.setShouldForwardMethodCallWithSelector("becomeFirstResponder", false)
        XCTAssertFalse(textView.becomeFirstResponderCalled, "The text view should not indicate having been asked to become first responder by default")
        let accepted = textView.becomeFirstResponder()
        XCTAssertTrue(textView.becomeFirstResponderCalled, "The text view should now indicate having been asked to become first responder")
        XCTAssertTrue(accepted, "The default implementation of this class returns `true`")
    }

    func testResignFirstResponderCall() {
        textView.resignFirstResponderCalled = false
        let resigned = textView.resignFirstResponder()
        XCTAssertTrue(textView.resignFirstResponderCalled, "The text view should now indicate having been asked to resign first responder status")
        XCTAssertFalse(resigned, "The default implementation of this class returns `true`, but this text view is not in a window")
    }

    func testUnforwardedResignFirstResponderCall() {
        textView.setShouldForwardMethodCallWithSelector("resignFirstResponder", false)
        textView.resignFirstResponderCalled = false
        let resigned = textView.resignFirstResponder()
        XCTAssertTrue(textView.resignFirstResponderCalled, "The text view should now indicate having been asked to resign first responder status")
        XCTAssertTrue(resigned, "The default implementation of this class returns `true`")
    }

}
