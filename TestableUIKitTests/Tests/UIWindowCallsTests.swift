//
//  UIWindowCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
@testable import TestableUIKit

class UIWindowCallsTests: XCTestCase {

    let window = UIWindow()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(window.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(window.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        window.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(window.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        window.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(window.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testMakeKeyWindowCall() {
        XCTAssertFalse(window.makeKeyWindowCalled, "The window should not indicate having had makeKeyWindow called by default")
        window.makeKeyWindow()
        XCTAssertTrue(window.makeKeyWindowCalled, "The window should now indicate having had makeKeyWindow called")
    }

    func testMakeKeyAndVisibleCall() {
        XCTAssertFalse(window.makeKeyAndVisibleCalled, "The window should not indicate having had makeKeyAndVisible called by default")
        window.makeKeyAndVisible()
        XCTAssertTrue(window.makeKeyAndVisibleCalled, "The window should now indicate having had makeKeyAndVisible called")
    }

}
