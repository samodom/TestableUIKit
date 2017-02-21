//
//  UIToolbarSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestSwagger
import TestableUIKit


class TestToolbar: UIToolbar {

    var setItemsTestMethodCalled = false
    dynamic override func setItems(_ items: [UIBarButtonItem]?, animated: Bool) {
        setItemsTestMethodCalled = true
    }

}


class UIToolbarSpiesTests: XCTestCase {

    let testToolbar = TestToolbar()
    var items: [UIBarButtonItem]!
    let selector = #selector(UIToolbarSpiesTests.handler)

    override func setUp() {
        super.setUp()

        items = [
            UIBarButtonItem(
                title: "Item 1",
                style: .plain,
                target: self,
                action: selector
            ),
            UIBarButtonItem(
                title: "Item 2",
                style: .plain,
                target: self,
                action: selector
            )
        ]
    }

    @IBAction func handler() {}


    //  MARK: - `setItems(_:animated:)`

    func testSetItemsControllerForwardingBehavior() {
        XCTAssertEqual(UIToolbar.SetItemsSpyController.forwardingBehavior, .always,
                       "Spies on `setItems(_:animated:)` should always forward their method invocations")
    }

    func testSetItemsSpyWithPositiveInput() {
        testToolbar.setItemsTestMethodCalled = false
        XCTAssertFalse(testToolbar.setItemsCalled,
                       "By default the toolbar should not indicate having had its items set")
        XCTAssertNil(testToolbar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(testToolbar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UIToolbar.SetItemsSpyController.createSpy(on: testToolbar)!
        spy.beginSpying()

        testToolbar.setItems(items, animated: true)
        XCTAssertTrue(testToolbar.setItemsCalled,
                      "A toolbar being spied upon should indicate having had `setItems(_:animated:)` called on it")
        XCTAssertEqual(testToolbar.setItemsItems!, items, "The items being set should be captured")
        XCTAssertTrue(testToolbar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertTrue(testToolbar.setItemsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testToolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(testToolbar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(testToolbar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testSetItemsSpyWithNegativeInput() {
        testToolbar.setItemsTestMethodCalled = false
        XCTAssertFalse(testToolbar.setItemsCalled,
                       "By default the toolbar should not indicate having had its items set")
        XCTAssertNil(testToolbar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(testToolbar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UIToolbar.SetItemsSpyController.createSpy(on: testToolbar)!
        spy.beginSpying()

        testToolbar.setItems(nil, animated: false)
        XCTAssertTrue(testToolbar.setItemsCalled,
                      "A toolbar being spied upon should indicate having had `setItems` called on it")
        XCTAssertNil(testToolbar.setItemsItems, "The items being set should be captured")
        XCTAssertFalse(testToolbar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertTrue(testToolbar.setItemsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testToolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(testToolbar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(testToolbar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

}
