//
//  UINavigationControllerCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
@testable import TestableUIKit

class UINavigationControllerCallsTests: XCTestCase {

    let navController = UINavigationController()

    override func setUp() {
        super.setUp()

        let window = UIApplication.sharedApplication().delegate!.window!!
        window.rootViewController = navController
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(navController.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(navController.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        navController.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(navController.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        navController.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(navController.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testPushViewControllerCall() {
        XCTAssertFalse(navController.pushViewControllerCalled, "The navigation controller should not indicate having had pushViewController called by default")
        XCTAssertNil(navController.pushViewControllerViewController, "The view controller should be missing by default")
        XCTAssertNil(navController.pushViewControllerAnimated, "The animated flag should be missing by default")
        let controller = UIViewController()
        navController.pushViewController(controller, animated: true)
        XCTAssertTrue(navController.pushViewControllerCalled, "The navigation controller should now indicate having had pushViewController called")
        XCTAssertEqual(navController.pushViewControllerViewController!, controller, "The view controller should be captured")
        XCTAssertTrue(navController.pushViewControllerAnimated!, "The animated flag should be captured")
    }

    func testForwardedPopViewControllerCall() {
        let controller = UIViewController()
        navController.pushViewController(controller, animated: true)
        XCTAssertFalse(navController.popViewControllerCalled, "The navigation controller should not indicate having had popViewController called by default")
        XCTAssertNil(navController.popViewControllerAnimated, "The animated flag should be missing by default")
        let poppedController = navController.popViewControllerAnimated(true)
        XCTAssertTrue(navController.popViewControllerCalled, "The navigation controller should now indicate having had popViewController called")
        XCTAssertTrue(navController.popViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedController, "The true implementation should return the controller that was popped, but it is not working correctly")
    }

    func testUnforwardedPopViewControllerCall() {
        navController.setShouldForwardMethodCallWithSelector("popViewControllerAnimated:", false)
        let controller = UIViewController()
        navController.pushViewController(controller, animated: false)
        XCTAssertFalse(navController.popViewControllerCalled, "The navigation controller should not indicate having had popViewController called by default")
        XCTAssertNil(navController.popViewControllerAnimated, "The animated flag should be missing by default")
        let poppedController = navController.popViewControllerAnimated(true)
        XCTAssertTrue(navController.popViewControllerCalled, "The navigation controller should now indicate having had popViewController called")
        XCTAssertTrue(navController.popViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedController, "The spy implementation should not return a controller when popping")
    }

    func testForwardedPopToRootViewControllerCall() {
        XCTAssertFalse(navController.popToRootViewControllerCalled, "The navigation controller should not indicate having had popToRootViewController called by default")
        XCTAssertNil(navController.popToRootViewControllerAnimated, "The animated flag should be missing by default")
        let controller1 = UIViewController()
        navController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navController.pushViewController(controller3, animated: false)
        let poppedControllers = navController.popToRootViewControllerAnimated(true) as? [UIViewController]
        XCTAssertTrue(navController.popToRootViewControllerCalled, "The navigation controller should now indicate having had popToRootViewController called")
        XCTAssertTrue(navController.popToRootViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The true implementation should return the controllers that were popped, but it is not working correctly")
    }

    func testUnforwardedPopToRootViewControllerCall() {
        navController.setShouldForwardMethodCallWithSelector("popToRootViewControllerAnimated:", false)
        XCTAssertFalse(navController.popToRootViewControllerCalled, "The navigation controller should not indicate having had popToRootViewController called by default")
        XCTAssertNil(navController.popToRootViewControllerAnimated, "The animated flag should be missing by default")
        let controller1 = UIViewController()
        navController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navController.pushViewController(controller3, animated: false)
        let poppedControllers = navController.popToRootViewControllerAnimated(false)
        navController.popToRootViewControllerAnimated(true)
        XCTAssertTrue(navController.popToRootViewControllerCalled, "The navigation controller should now indicate having had popToRootViewController called")
        XCTAssertTrue(navController.popToRootViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The spy implementation should not return controllers when popping")
    }

    func testForwardedPopToViewControllerCall() {
        let controller1 = UIViewController()
        navController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navController.pushViewController(controller3, animated: false)
        XCTAssertFalse(navController.popToViewControllerCalled, "The navigation controller should not indicate having had popToViewController called by default")
        XCTAssertNil(navController.popToViewControllerViewController, "The view controller should be missing by default")
        XCTAssertNil(navController.popToViewControllerAnimated, "The animated flag should be missing by default")
        let poppedControllers = navController.popToViewController(controller1, animated: true) as? [UIViewController]
        XCTAssertTrue(navController.popToViewControllerCalled, "The navigation controller should now indicate having had popToViewController called")
        XCTAssertEqual(navController.popToViewControllerViewController!, controller1, "The view controller should be captured")
        XCTAssertTrue(navController.popToViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The true implementation should return the controllers that were popped, but it is not working correctly")
    }

    func testUnforwardedPopToViewControllerCall() {
        navController.setShouldForwardMethodCallWithSelector("popToViewController:animated:", false)
        let controller1 = UIViewController()
        navController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navController.pushViewController(controller3, animated: false)
        XCTAssertFalse(navController.popToViewControllerCalled, "The navigation controller should not indicate having had popToViewController called by default")
        XCTAssertNil(navController.popToViewControllerViewController, "The view controller should be missing by default")
        XCTAssertNil(navController.popToViewControllerAnimated, "The animated flag should be missing by default")
        let poppedControllers = navController.popToViewController(controller1, animated: true) as? [UIViewController]
        XCTAssertTrue(navController.popToViewControllerCalled, "The navigation controller should now indicate having had popToViewController called")
        XCTAssertEqual(navController.popToViewControllerViewController!, controller1, "The view controller should be captured")
        XCTAssertTrue(navController.popToViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The spy implementation should not return controllers when popping")
    }

}
