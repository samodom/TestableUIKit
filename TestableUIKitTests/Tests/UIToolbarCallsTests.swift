//
//  UIToolbarCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIToolbarCallsTests: XCTestCase {

    let bar = UIToolbar()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(bar.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(bar.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        bar.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(bar.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        bar.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(bar.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testSetItemsCall() {
        let item1 = UIBarButtonItem(title: "Item 1", style: .Plain, target: nil, action: Selector("foobar"))
        let item2 = UIBarButtonItem(title: "Item 2", style: .Plain, target: nil, action: Selector("barfoo"))
        XCTAssertFalse(bar.setItemsCalled, "The toolbar should not indicate having had setItems called by default");
        XCTAssertNil(bar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(bar.setItemsAnimated, "The animation flag should be missing by default")
        bar.setItems([item1, item2], animated: true)
        XCTAssertTrue(bar.setItemsCalled, "The toolbar should now indicate having had setItems called");
        XCTAssertEqual(bar.setItemsItems!, [item1, item2], "The navigation item should be captured")
        XCTAssertTrue(bar.setItemsAnimated!, "The animation flag should be captured")
    }

}
