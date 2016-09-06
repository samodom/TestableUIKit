//
//  UINavigationBarCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UINavigationBarCallsTests: XCTestCase {

    let bar = UINavigationBar()

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

    func testPushNavigationItemCall() {
        XCTAssertFalse(bar.pushNavigationItemCalled, "The navigation bar should not indicate having had pushNavigationItem called by default");
        XCTAssertNil(bar.pushNavigationItemNavigationItem, "The navigation item should be missing by default")
        XCTAssertNil(bar.pushNavigationItemAnimated, "The animation flag should be missing by default")
        let item = UINavigationItem(title: "Sample Item")
        bar.pushNavigationItem(item, animated: true)
        XCTAssertTrue(bar.pushNavigationItemCalled, "The navigation bar should now indicate having had pushNavigationItem called");
        XCTAssertEqual(bar.pushNavigationItemNavigationItem!, item, "The navigation item should be captured")
        XCTAssertTrue(bar.pushNavigationItemAnimated!, "The animation flag should be captured")
    }

    func testForwardedPopNavigationItemCall() {
        let item = UINavigationItem(title: "Sample Item")
        bar.pushNavigationItem(item, animated: true)
        XCTAssertFalse(bar.popNavigationItemCalled, "The navigation bar should not indicate having had popNavigationItem called by default");
        XCTAssertNil(bar.popNavigationItemAnimated, "The animation flag should be missing by default")
        let poppedItem = bar.popNavigationItemAnimated(true)
        XCTAssertTrue(bar.popNavigationItemCalled, "The navigation bar should now indicate having had popNavigationItem called");
        XCTAssertTrue(bar.popNavigationItemAnimated!, "The animation flag should be captured")
        XCTAssertEqual(poppedItem!, item, "The navigation item should be returned when forwarding to the default implementation")
    }

    func testUnforwardedPopNavigationItemCall() {
        bar.setShouldForwardMethodCallWithSelector("popNavigationItemAnimated:", false)
        let item = UINavigationItem(title: "Sample Item")
        bar.pushNavigationItem(item, animated: true)
        XCTAssertFalse(bar.popNavigationItemCalled, "The navigation bar should not indicate having had popNavigationItem called by default");
        XCTAssertNil(bar.popNavigationItemAnimated, "The animation flag should be missing by default")
        let poppedItem = bar.popNavigationItemAnimated(true)
        XCTAssertTrue(bar.popNavigationItemCalled, "The navigation bar should now indicate having had popNavigationItem called");
        XCTAssertTrue(bar.popNavigationItemAnimated!, "The animation flag should be captured")
        XCTAssertNil(poppedItem, "No popped item should be returned when not forwarding to the default implementation")
    }

    func testSetItemsCall() {
        XCTAssertFalse(bar.setItemsCalled, "The navigation bar should not indicate having had setItems called by default");
        XCTAssertNil(bar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(bar.setItemsAnimated, "The animation flag should be missing by default")
        let items = [UINavigationItem(title: "Item 1"), UINavigationItem(title: "Item 2")]
        bar.setItems(items, animated: true)
        XCTAssertTrue(bar.setItemsCalled, "The navigation bar should now indicate having had setItems called");
        XCTAssertEqual(bar.setItemsItems!, items, "The navigation item should be captured")
        XCTAssertTrue(bar.setItemsAnimated!, "The animation flag should be captured")
    }

}
