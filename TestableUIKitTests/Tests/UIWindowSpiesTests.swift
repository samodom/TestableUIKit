//
//  UIWindowSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestSwagger
import TestableUIKit


class TestWindow: UIWindow {

    var makeKeyTestMethodCalled = false
    dynamic override func makeKey() {
        makeKeyTestMethodCalled = true
    }

    var makeKeyAndVisibleTestMethodCalled = false
    dynamic override func makeKeyAndVisible() {
        makeKeyAndVisibleTestMethodCalled = true
    }

}


class UIWindowSpiesTests: XCTestCase {

    let window = TestWindow()


    // MARK: - `makeKey`

    func testMakeKeyControllerForwardingBehavior() {
        XCTAssertTrue(UIWindow.MakeKeySpyController.forwardsInvocations,
                      "Spies on `makeKey` should always forward their method invocations")
    }

    func testMakeKeySpy() {
        window.makeKeyTestMethodCalled = false
        XCTAssertFalse(window.makeKeyCalled,
                       "By default the window should not indicate having been made the key window")

        let spy = UIWindow.MakeKeySpyController.createSpy(on: window)!
        spy.beginSpying()

        window.makeKey()
        XCTAssertTrue(window.makeKeyCalled,
                      "A window being spied upon should indicate having had `makeKey` called on it")
        XCTAssertTrue(window.makeKeyTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(window.makeKeyCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `makeKeyAndVisible`

    func testMakeKeyAndVisibleControllerForwardingBehavior() {
        XCTAssertTrue(UIWindow.MakeKeyAndVisibleSpyController.forwardsInvocations,
                      "Spies on `makeKeyAndVisible` should always forward their method invocations")
    }

    func testMakeKeyAndVisibleSpy() {
        window.makeKeyAndVisibleTestMethodCalled = false
        XCTAssertFalse(window.makeKeyAndVisibleCalled,
                       "By default the window should not indicate having been made the key window and visible")

        let spy = UIWindow.MakeKeyAndVisibleSpyController.createSpy(on: window)!
        spy.beginSpying()

        window.makeKeyAndVisible()
        XCTAssertTrue(window.makeKeyAndVisibleCalled,
                      "A window being spied upon should indicate having had `makeKeyAndVisible` called on it")
        XCTAssertTrue(window.makeKeyAndVisibleTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(window.makeKeyAndVisibleCalled,
                       "The flag should be cleared after spying is complete")
    }

}
