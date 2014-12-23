//
//  UIWindowCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIWindowCallsTests: XCTestCase {

    let window = UIWindow()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
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
