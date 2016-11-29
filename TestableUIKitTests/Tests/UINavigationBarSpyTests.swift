//
//  UINavigationBarSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UINavigationBarSpyTests: SpyTestCase {

    let navigationBar = UINavigationBar()
    let item1 = UINavigationItem(title: "Sample Item")
    let item2 = UINavigationItem(title: "Another Sample Item")
    var items: [UINavigationItem]!

    override func setUp() {
        super.setUp()

        items = [item1, item2]
    }

    func testMethodCallForwarding() {
        XCTAssertTrue(navigationBar.forwardsMethodCallsByDefault, "By default this spy should forward its method")
        UINavigationBarSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(navigationBar.forwardsMethodCalls(for: selector),
                          "By default `UINavigationBar` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `pushItem(_:animated:)`

    func testPushItemCallWithContext() {
        association = UINavigationBarSpyAssociations.pushItem
        inspectImplementations()

        XCTAssertFalse(navigationBar.pushItemCalled,
                       "The navigation bar should not indicate having had `pushItem(_:animated:)` called by default");
        XCTAssertNil(navigationBar.pushItemItem, "The navigation item should be missing by default")
        XCTAssertNil(navigationBar.pushItemAnimated, "The animation flag should be missing by default")

        navigationBar.spyOnPushItem {
            validateMethodsAreSwizzled()

            navigationBar.pushItem(item1, animated: true)

            XCTAssertTrue(navigationBar.pushItemCalled,
                          "The navigation bar should now indicate having had `pushItem(_:animated:)` called");
            XCTAssertEqual(navigationBar.pushItemItem!, item1, "The navigation item should be captured")
            XCTAssertTrue(navigationBar.pushItemAnimated!, "The animation flag should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.pushItemCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemItem, "The item should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemAnimated, "The animation flag should be cleared after spying is complete")
    }

    func testPushItemCallWithoutContext() {
        association = UINavigationBarSpyAssociations.pushItem
        inspectImplementations()

        XCTAssertFalse(navigationBar.pushItemCalled,
                       "The navigation bar should not indicate having had `pushItem(_:animated:)` called by default");
        XCTAssertNil(navigationBar.pushItemItem, "The navigation item should be missing by default")
        XCTAssertNil(navigationBar.pushItemAnimated, "The animation flag should be missing by default")

        navigationBar.beginSpyingOnPushItem()
        validateMethodsAreSwizzled()

        navigationBar.pushItem(item1, animated: true)

        XCTAssertTrue(navigationBar.pushItemCalled,
                      "The navigation bar should now indicate having had `pushItem(_:animated:)` called");
        XCTAssertEqual(navigationBar.pushItemItem!, item1, "The navigation item should be captured")
        XCTAssertTrue(navigationBar.pushItemAnimated!, "The animation flag should be captured")

        navigationBar.endSpyingOnPushItem()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.pushItemCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemItem, "The item should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemAnimated, "The animation flag should be cleared after spying is complete")
    }


    //  MARK: - `popItem(animated:)`

    func testPopItemCallWithContext() {
        association = UINavigationBarSpyAssociations.popItem
        inspectImplementations()

        XCTAssertFalse(navigationBar.popItemCalled,
                       "The navigation bar should not indicate having had `popItem(animated:)` called by default");
        XCTAssertNil(navigationBar.popItemAnimated, "The animation flag should be missing by default")

        navigationBar.spyOnPopItem {
            validateMethodsAreSwizzled()

            navigationBar.popItem(animated: true)

            XCTAssertTrue(navigationBar.popItemCalled,
                          "The navigation bar should now indicate having had `popItem(animated:)` called");
            XCTAssertTrue(navigationBar.popItemAnimated!, "The animation flag should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.popItemCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.popItemAnimated, "The animation flag should be cleared after spying is complete")
    }

    func testPopItemCallWithoutContext() {
        association = UINavigationBarSpyAssociations.popItem
        inspectImplementations()

        XCTAssertFalse(navigationBar.popItemCalled,
                       "The navigation bar should not indicate having had `popItem(animated:)` called by default");
        XCTAssertNil(navigationBar.popItemAnimated, "The animation flag should be missing by default")

        navigationBar.beginSpyingOnPopItem()
        validateMethodsAreSwizzled()

        navigationBar.popItem(animated: true)

        XCTAssertTrue(navigationBar.popItemCalled,
                      "The navigation bar should now indicate having had `popItem(animated:)` called");
        XCTAssertTrue(navigationBar.popItemAnimated!, "The animation flag should be captured")

        navigationBar.endSpyingOnPopItem()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.popItemCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.popItemAnimated, "The animation flag should be cleared after spying is complete")
    }


    //  MARK: - `setItems(_:animated:)`

    func testSetItemsCallWithContext() {
        association = UINavigationBarSpyAssociations.setItems
        inspectImplementations()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The navigation bar should not indicate having had `setItems(_:animated:)` called by default")
        XCTAssertNil(navigationBar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(navigationBar.setItemsAnimated, "The animation flag should be missing by default")

        navigationBar.spyOnSetItems {
            validateMethodsAreSwizzled()

            navigationBar.setItems(items, animated: true)
            XCTAssertTrue(navigationBar.setItemsCalled,
                          "The navigation bar should now indicate having had `setItems(_:animated:)` called")
            XCTAssertEqual(navigationBar.setItemsItems!, items, "The items should be captured")
            XCTAssertTrue(navigationBar.setItemsAnimated!, "The animation flag should be captured")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsItems, "The items should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsAnimated, "The animation flag should be cleared after spying is complete")
    }

    func testSetItemsCallWithoutContext() {
        association = UINavigationBarSpyAssociations.setItems
        inspectImplementations()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The navigation bar should not indicate having had `setItems(_:animated:)` called by default")
        XCTAssertNil(navigationBar.setItemsItems, "The items should be missing by default")
        XCTAssertNil(navigationBar.setItemsAnimated, "The animation flag should be missing by default")

        navigationBar.beginSpyingOnSetItems()
        validateMethodsAreSwizzled()

        navigationBar.setItems(items, animated: true)
        XCTAssertTrue(navigationBar.setItemsCalled,
                      "The navigation bar should now indicate having had `setItems(_:animated:)` called")
        XCTAssertEqual(navigationBar.setItemsItems!, items, "The items should be captured")
        XCTAssertTrue(navigationBar.setItemsAnimated!, "The animation flag should be captured")

        navigationBar.endSpyingOnSetItems()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsItems, "The items should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsAnimated, "The animation flag should be cleared after spying is complete")
    }

}


fileprivate extension UINavigationBarSpyAssociations {

    static let allAssociations = [
        UINavigationBarSpyAssociations.pushItem,
        UINavigationBarSpyAssociations.popItem,
        UINavigationBarSpyAssociations.setItems
    ]
    
}
