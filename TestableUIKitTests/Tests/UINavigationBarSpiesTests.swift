//
//  UINavigationBarSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestSwagger
import TestableUIKit


class UINavigationBarSpiesTests: XCTestCase {

    let navigationBar = UINavigationBar()
    let item1 = UINavigationItem(title: "Item 1")
    let item2 = UINavigationItem(title: "Item 2")


    // MARK: - `pushItem(_:animated:)`

    func testPushItemControllerForwardingBehavior() {
        XCTAssertEqual(UINavigationBar.PushItemSpyController.forwardingBehavior, .always,
                       "Spies on `pushItem(_:animated:)` should always forward their method invocations")
    }

    func testPushItemSpy() {
        XCTAssertFalse(navigationBar.pushItemCalled,
                       "By default the navigation bar should not indicate having had an item pushed")
        XCTAssertNil(navigationBar.pushItemItem, "By default the item should be empty")
        XCTAssertNil(navigationBar.pushItemAnimated,
                     "By default the animation flag should be empty")

        let spy = UINavigationBar.PushItemSpyController.createSpy(on: navigationBar)!
        spy.beginSpying()

        navigationBar.pushItem(item1, animated: true)
        XCTAssertTrue(navigationBar.pushItemCalled,
                      "A navigation bar being spied upon should indicate having had `pushItem(_:animated:)` called on it")
        XCTAssertEqual(navigationBar.pushItemItem!, item1, "The item being pushed should be captured")
        XCTAssertTrue(navigationBar.pushItemAnimated!, "The animation flag should be captured")
        XCTAssertEqual(navigationBar.items!, [item1],
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(navigationBar.pushItemCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemItem,
                     "The item should be cleared after spying is complete")
        XCTAssertNil(navigationBar.pushItemAnimated,
                     "The animation flag should be cleared after spying is complete")
    }


    // MARK: - `popItem(animated:)`

    func testPopItemControllerForwardingBehavior() {
        XCTAssertEqual(UINavigationBar.PopItemSpyController.forwardingBehavior, .always,
                       "Spies on `popItem(animated:)` should always forward their method invocations")
    }

    func testPopItemSpy() {
        navigationBar.pushItem(item1, animated: false)
        XCTAssertFalse(navigationBar.popItemCalled,
                       "By default the navigation bar should not indicate having had an item popped")
        XCTAssertNil(navigationBar.popItemAnimated,
                     "By default the animation flag should be empty")

        let spy = UINavigationBar.PopItemSpyController.createSpy(on: navigationBar)!
        spy.beginSpying()

        let popped = navigationBar.popItem(animated: true)
        XCTAssertTrue(navigationBar.popItemCalled,
                      "A navigation bar being spied upon should indicate having had `popItem(animated:)` called on it")
        XCTAssertTrue(navigationBar.popItemAnimated!, "The animation flag should be captured")
        XCTAssertEqual(popped!, item1,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(navigationBar.popItemCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.popItemAnimated,
                     "The animation flag should be cleared after spying is complete")
    }


    // MARK: - `setItems(_:animated:)`

    func testSetItemsControllerForwardingBehavior() {
        XCTAssertEqual(UINavigationBar.SetItemsSpyController.forwardingBehavior, .always,
                       "Spies on `setItems` should always forward their method invocations")
    }

    func testSetItemsSpyWithPositiveInput() {
        XCTAssertFalse(navigationBar.setItemsCalled,
                       "By default the navigation bar should not indicate having had its items set")
        XCTAssertNil(navigationBar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(navigationBar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UINavigationBar.SetItemsSpyController.createSpy(on: navigationBar)!
        spy.beginSpying()

        navigationBar.setItems([item1, item2], animated: true)
        XCTAssertTrue(navigationBar.setItemsCalled,
                      "A navigation bar being spied upon should indicate having had `setItems` called on it")
        XCTAssertEqual(navigationBar.setItemsItems!, [item1, item2], "The items being set should be captured")
        XCTAssertTrue(navigationBar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertEqual(navigationBar.items!, [item1, item2],
                       "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testSetItemsSpyWithNegativeInput() {
        XCTAssertFalse(navigationBar.setItemsCalled,
                       "By default the navigation bar should not indicate having had its items set")
        XCTAssertNil(navigationBar.setItemsItems, "By default the items should be empty")
        XCTAssertNil(navigationBar.setItemsAnimated, "By default the animation flag should be empty")

        let spy = UINavigationBar.SetItemsSpyController.createSpy(on: navigationBar)!
        spy.beginSpying()

        navigationBar.setItems(nil, animated: false)
        XCTAssertTrue(navigationBar.setItemsCalled,
                      "A navigation bar being spied upon should indicate having had `setItems` called on it")
        XCTAssertNil(navigationBar.setItemsItems, "The items being set should be captured")
        XCTAssertFalse(navigationBar.setItemsAnimated!, "The animation flag should be captured")
        XCTAssertTrue(navigationBar.items!.isEmpty,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(navigationBar.setItemsCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsItems,
                     "The items should be cleared after spying is complete")
        XCTAssertNil(navigationBar.setItemsAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

}
