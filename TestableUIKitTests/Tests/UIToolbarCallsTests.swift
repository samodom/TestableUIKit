//
//  UIToolbarCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UIToolbarCallsTests: SpyTestCase {

    let toolbar = UIToolbar()
    let selector = #selector(UIToolbarCallsTests.handler)
    var items: [UIBarButtonItem]!

    @IBAction func handler() {}

    override func setUp() {
        super.setUp()

        UIApplication.rootView.addSubview(toolbar)

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

    override func tearDown() {
        toolbar.removeFromSuperview()

        super.tearDown()
    }

    func testDefaultMethodCallForwarding() {
        XCTAssertTrue(toolbar.forwardsMethodCallsByDefault, "By default this spy should forward its method")
        UIToolbarSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(toolbar.forwardsMethodCalls(for: selector),
                           "By default `UIToolbar` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `setItems(_:animated:)`

    func testSetItemsCallWithContext() {
        association = UIToolbarSpyAssociations.setItems
        inspectImplementations()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The toolbar should not indicate having had `setItems(_:animated:)` called by default")
        XCTAssertNil(toolbar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(toolbar.setItemsAnimated, "The animation flag should be missing by default")

        toolbar.spyOnSetItems {
            validateMethodsAreSwizzled()

            toolbar.setItems(items, animated: true)
            XCTAssertTrue(toolbar.setItemsCalled,
                          "The toolbar should now indicate having had `setItems(_:animated:)` called")
            XCTAssertEqual(toolbar.setItemsItems!, items, "The items should be captured")
            XCTAssertTrue(toolbar.setItemsAnimated!, "The animation flag should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsItems, "The items should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsAnimated, "The animation flag should be cleared after spying is complete")
    }

    func testSetItemsCallWithoutContext() {
        association = UIToolbarSpyAssociations.setItems
        inspectImplementations()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The toolbar should not indicate having had `setItems(_:animated:)` called by default")
        XCTAssertNil(toolbar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(toolbar.setItemsAnimated, "The animation flag should be missing by default")

        toolbar.beginSpyingOnSetItems()
        validateMethodsAreSwizzled()

        toolbar.setItems(items, animated: true)
        XCTAssertTrue(toolbar.setItemsCalled,
                      "The toolbar should now indicate having had `setItems(_:animated:)` called")
        XCTAssertEqual(toolbar.setItemsItems!, items, "The items should be captured")
        XCTAssertTrue(toolbar.setItemsAnimated!, "The animation flag should be captured")

        toolbar.endSpyingOnSetItems()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(toolbar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsItems, "The items should be cleared after spying is complete")
        XCTAssertNil(toolbar.setItemsAnimated, "The animation flag should be cleared after spying is complete")
    }

}


fileprivate extension UIToolbarSpyAssociations {

    static let allAssociations = [
        UIToolbarSpyAssociations.setItems
    ]

}
