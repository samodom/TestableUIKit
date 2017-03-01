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

    let toolbar = TestToolbar()
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


    // MARK: - `setItems(_:animated:)`

    func testSetItemsControllerForwardingBehavior() {
        XCTAssertTrue(UIToolbar.SetItemsSpyController.forwardsInvocations,
                       "Spies on `setItems(_:animated:)` should always forward their method invocations")
    }

    func testSetItemsSpyWithPositiveInput() {
        toolbar.setItemsTestMethodCalled = false
        XCTAssertFalse(toolbar.setItemsCalled,
                       "By default the toolbar should not indicate having had its items set")
        XCTAssertNil(toolbar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(toolbar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UIToolbar.SetItemsSpyController.createSpy(on: toolbar)!
        spy.beginSpying()

        toolbar.setItems(items, animated: true)
        XCTAssertTrue(toolbar.setItemsCalled,
                      "A toolbar being spied upon should indicate having had `setItems(_:animated:)` called on it")
        XCTAssertEqual(toolbar.setItemsItems!, items, "The items being set should be captured")
        XCTAssertTrue(toolbar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertTrue(toolbar.setItemsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testSetItemsSpyWithNegativeInput() {
        toolbar.setItemsTestMethodCalled = false
        XCTAssertFalse(toolbar.setItemsCalled,
                       "By default the toolbar should not indicate having had its items set")
        XCTAssertNil(toolbar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(toolbar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UIToolbar.SetItemsSpyController.createSpy(on: toolbar)!
        spy.beginSpying()

        toolbar.setItems(nil, animated: false)
        XCTAssertTrue(toolbar.setItemsCalled,
                      "A toolbar being spied upon should indicate having had `setItems` called on it")
        XCTAssertNil(toolbar.setItemsItems, "The items being set should be captured")
        XCTAssertFalse(toolbar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertTrue(toolbar.setItemsTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

}
