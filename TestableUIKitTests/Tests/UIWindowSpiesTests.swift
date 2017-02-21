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

    let testWindow = TestWindow()


    //  MARK: - `makeKey`

    func testMakeKeyControllerForwardingBehavior() {
        XCTAssertEqual(UIWindow.MakeKeySpyController.forwardingBehavior, .always,
                       "Spies on `makeKey` should always forward their method invocations")
    }

    func testMakeKeySpy() {
        testWindow.makeKeyTestMethodCalled = false
        XCTAssertFalse(testWindow.makeKeyCalled,
                       "By default the window should not indicate having been made the key window")

        let spy = UIWindow.MakeKeySpyController.createSpy(on: testWindow)!
        spy.beginSpying()

        testWindow.makeKey()
        XCTAssertTrue(testWindow.makeKeyCalled,
                      "A window being spied upon should indicate having had `makeKey` called on it")
        XCTAssertTrue(testWindow.makeKeyTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testWindow.makeKeyCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `makeKeyAndVisible`

    func testMakeKeyAndVisibleControllerForwardingBehavior() {
        XCTAssertEqual(UIWindow.MakeKeyAndVisibleSpyController.forwardingBehavior, .always,
                       "Spies on `makeKeyAndVisible` should always forward their method invocations")
    }

    func testMakeKeyAndVisibleSpy() {
        testWindow.makeKeyAndVisibleTestMethodCalled = false
        XCTAssertFalse(testWindow.makeKeyAndVisibleCalled,
                       "By default the window should not indicate having been made the key window and visible")

        let spy = UIWindow.MakeKeyAndVisibleSpyController.createSpy(on: testWindow)!
        spy.beginSpying()

        testWindow.makeKeyAndVisible()
        XCTAssertTrue(testWindow.makeKeyAndVisibleCalled,
                      "A window being spied upon should indicate having had `makeKeyAndVisible` called on it")
        XCTAssertTrue(testWindow.makeKeyAndVisibleTestMethodCalled,
                      "The spy method should always forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(testWindow.makeKeyAndVisibleCalled,
                       "The flag should be cleared after spying is complete")
    }

}
