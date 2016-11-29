//
//  UIWindowSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/22/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UIWindowSpyTests: SpyTestCase {

    let window = UIApplication.window

    func testMethodCallForwarding() {
        XCTAssertTrue(window.forwardsMethodCallsByDefault, "This spy should forward method calls by default")
        UIWindowSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(window.forwardsMethodCalls(for: selector),
                           "By default `UIWindow` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `makeKey`

    func testMakeKeyCallWithContext() {
        association = UIWindowSpyAssociations.makeKey
        inspectImplementations()

        XCTAssertFalse(window.makeKeyCalled,
                       "The window should not indicate having had `makeKey` called by default")

        window.spyOnMakeKey {
            validateMethodsAreSwizzled()

            window.makeKey()
            XCTAssertTrue(window.makeKeyCalled,
                          "The window should now indicate having had `makeKey` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(window.makeKeyCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testMakeKeyCallWithoutContext() {
        association = UIWindowSpyAssociations.makeKey
        inspectImplementations()

        XCTAssertFalse(window.makeKeyCalled,
                       "The window should not indicate having had `makeKey` called by default")

        window.beginSpyingOnMakeKey()
        validateMethodsAreSwizzled()

        window.makeKey()
        XCTAssertTrue(window.makeKeyCalled,
                      "The window should now indicate having had `makeKey` called")

        window.endSpyingOnMakeKey()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(window.makeKeyCalled, "The flag should be cleared after spying is complete")
    }


    //  MARK: - `makeKeyAndVisible`

    func testMakeKeyAndVisibleCallWithContext() {
        association = UIWindowSpyAssociations.makeKeyAndVisible
        inspectImplementations()

        XCTAssertFalse(window.makeKeyAndVisibleCalled,
                       "The window should not indicate having had `makeKeyAndVisible` called by default")

        window.spyOnMakeKeyAndVisible {
            validateMethodsAreSwizzled()

            window.makeKeyAndVisible()
            XCTAssertTrue(window.makeKeyAndVisibleCalled,
                          "The window should now indicate having had `makeKeyAndVisible` called")
        }

        validateMethodsAreNotSwizzled()

        XCTAssertFalse(window.makeKeyAndVisibleCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testMakeKeyAndVisibleCallWithoutContext() {
        association = UIWindowSpyAssociations.makeKeyAndVisible
        inspectImplementations()

        XCTAssertFalse(window.makeKeyAndVisibleCalled,
                       "The window should not indicate having had `makeKeyAndVisible` called by default")

        window.beginSpyingOnMakeKeyAndVisible()
        validateMethodsAreSwizzled()

        window.makeKeyAndVisible()
        XCTAssertTrue(window.makeKeyAndVisibleCalled,
                      "The window should now indicate having had `makeKeyAndVisible` called")

        window.endSpyingOnMakeKeyAndVisible()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(window.makeKeyAndVisibleCalled, "The flag should be cleared after spying is complete")
    }

}


fileprivate extension UIWindowSpyAssociations {

    static let allAssociations = [
        UIWindowSpyAssociations.makeKey,
        UIWindowSpyAssociations.makeKeyAndVisible
    ]
    
}
