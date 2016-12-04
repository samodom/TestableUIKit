//
//  UINavigationControllerSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UINavigationControllerSpyTests: SpyTestCase {

    var window: UIWindow!
    var previousViewController: UIViewController?
    let navigationController = UINavigationController()
    let sampleController = UIViewController()

    override func setUp() {
        super.setUp()

        previousViewController = window.rootViewController
        window.rootViewController = navigationController
    }

    override func tearDown() {
        window.rootViewController = previousViewController

        super.tearDown()
    }

    func testMethodCallForwarding() {
        XCTAssertTrue(navigationController.forwardsMethodCallsByDefault, "By default this spy should forward its method")
        UINavigationControllerSpyAssociations.allAssociations.forEach { association in
            let selector = association.originalSelector
            XCTAssertTrue(navigationController.forwardsMethodCalls(for: selector),
                          "By default `UINavigationController` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `pushViewController(_:animated:)`

    func testPushViewControllerCallWithContext() {
        association = UINavigationControllerSpyAssociations.pushViewController
        inspectImplementations()

        XCTAssertFalse(navigationController.pushViewControllerCalled,
                       "The navigation controller should not indicate having had `pushViewController(_:animated:)` called by default")
        XCTAssertNil(navigationController.pushViewControllerController,
                     "The view controller should be missing by default")
        XCTAssertNil(navigationController.pushViewControllerAnimated,
                     "The animation flag should be missing by default")

        navigationController.spyOnPushViewController {
            validateMethodsAreSwizzled()

            navigationController.pushViewController(controller, animated: true)
            XCTAssertTrue(navigationController.pushViewControllerCalled,
                          "The navigation controller should now indicate having had `pushViewController(_:animated:)` called")
            XCTAssertEqual(navigationController.pushViewControllerController!, controller,
                           "The view controller should be captured")
            XCTAssertTrue(navigationController.pushViewControllerAnimated!,
                          "The animation flag should be captured")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationController.pushViewControllerCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationController.pushViewControllerController,
                     "The controller should be cleared after spying is complete")
        XCTAssertNil(navigationController.pushViewControllerAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testPushViewControllerCallWithContext() {
        association = UINavigationControllerSpyAssociations.pushViewController
        inspectImplementations()

        XCTAssertFalse(navigationController.pushViewControllerCalled,
                       "The navigation controller should not indicate having had `pushViewController(_:animated:)` called by default")
        XCTAssertNil(navigationController.pushViewControllerController,
                     "The view controller should be missing by default")
        XCTAssertNil(navigationController.pushViewControllerAnimated,
                     "The animation flag should be missing by default")

        navigationController.startSpyingOnPushViewController()
        validateMethodsAreSwizzled()

        navigationController.pushViewController(controller, animated: true)
        XCTAssertTrue(navigationController.pushViewControllerCalled,
                      "The navigation controller should now indicate having had `pushViewController(_:animated:)` called")
        XCTAssertEqual(navigationController.pushViewControllerController!, controller,
                       "The view controller should be captured")
        XCTAssertTrue(navigationController.pushViewControllerAnimated!,
                      "The animation flag should be captured")

        navigationController.endSpyingOnPushViewController()
        validateMethodsAreNotSwizzled()

        XCTAssertFalse(navigationController.pushViewControllerCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(navigationController.pushViewControllerController,
                     "The controller should be cleared after spying is complete")
        XCTAssertNil(navigationController.pushViewControllerAnimated,
                     "The animation flag should be cleared after spying is complete")
    }


    /*

    func testForwardedPopViewControllerCallWithoutContext() {
        let controller = UIViewController()
        navigationController.pushViewController(controller, animated: true)
        XCTAssertFalse(navigationController.popViewControllerCalled, "The navigation controller should not indicate having had popViewController called by default")
        XCTAssertNil(navigationController.popViewController, "The animated flag should be missing by default")
        let poppedController = navigationController.popViewController(animated: true)
        XCTAssertTrue(navigationController.popViewControllerCalled, "The navigation controller should now indicate having had popViewController called")
        XCTAssertTrue(navigationController.popViewControllerAnimated, "The animated flag should be captured")
        XCTAssertNil(poppedController, "The true implementation should return the controller that was popped, but it is not working correctly")
    }

    func testUnforwardedPopViewControllerCall() {
        navigationController.setShouldForwardMethodCallWithSelector("popViewControllerAnimated:", false)
        let controller = UIViewController()
        navigationController.pushViewController(controller, animated: false)
        XCTAssertFalse(navigationController.popViewControllerCalled, "The navigation controller should not indicate having had popViewController called by default")
        XCTAssertNil(navigationController.popViewController, "The animated flag should be missing by default")
        let poppedController = navigationController.popViewController(animated: true)
        XCTAssertTrue(navigationController.popViewControllerCalled, "The navigation controller should now indicate having had popViewController called")
        XCTAssertTrue(navigationController.popViewControllerAnimated, "The animated flag should be captured")
        XCTAssertNil(poppedController, "The spy implementation should not return a controller when popping")
    }

    func testForwardedPopToRootViewControllerCall() {
        XCTAssertFalse(navigationController.popToRootViewControllerCalled, "The navigation controller should not indicate having had popToRootViewController called by default")
        XCTAssertNil(navigationController.popToRootViewController, "The animated flag should be missing by default")
        let controller1 = UIViewController()
        navigationController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navigationController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navigationController.pushViewController(controller3, animated: false)
        let poppedControllers = navigationController.popToRootViewController(animated: true) as? [UIViewController]
        XCTAssertTrue(navigationController.popToRootViewControllerCalled, "The navigation controller should now indicate having had popToRootViewController called")
        XCTAssertTrue(navigationController.popToRootViewControllerAnimated, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The true implementation should return the controllers that were popped, but it is not working correctly")
    }

    func testUnforwardedPopToRootViewControllerCall() {
        navigationController.setShouldForwardMethodCallWithSelector("popToRootViewControllerAnimated:", false)
        XCTAssertFalse(navigationController.popToRootViewControllerCalled, "The navigation controller should not indicate having had popToRootViewController called by default")
        XCTAssertNil(navigationController.popToRootViewController, "The animated flag should be missing by default")
        let controller1 = UIViewController()
        navigationController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navigationController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navigationController.pushViewController(controller3, animated: false)
        let poppedControllers = navigationController.popToRootViewController(animated: false)
        navigationController.popToRootViewController(animated: true)
        XCTAssertTrue(navigationController.popToRootViewControllerCalled, "The navigation controller should now indicate having had popToRootViewController called")
        XCTAssertTrue(navigationController.popToRootViewControllerAnimated, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The spy implementation should not return controllers when popping")
    }

    func testForwardedPopToViewControllerCall() {
        let controller1 = UIViewController()
        navigationController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navigationController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navigationController.pushViewController(controller3, animated: false)
        XCTAssertFalse(navigationController.popToViewControllerCalled, "The navigation controller should not indicate having had popToViewController called by default")
        XCTAssertNil(navigationController.popToViewControllerViewController, "The view controller should be missing by default")
        XCTAssertNil(navigationController.popToViewControllerAnimated, "The animated flag should be missing by default")
        let poppedControllers = navigationController.popToViewController(controller1, animated: true) as? [UIViewController]
        XCTAssertTrue(navigationController.popToViewControllerCalled, "The navigation controller should now indicate having had popToViewController called")
        XCTAssertEqual(navigationController.popToViewControllerViewController!, controller1, "The view controller should be captured")
        XCTAssertTrue(navigationController.popToViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The true implementation should return the controllers that were popped, but it is not working correctly")
    }

    func testUnforwardedPopToViewControllerCall() {
        navigationController.setShouldForwardMethodCallWithSelector("popToViewController:animated:", false)
        let controller1 = UIViewController()
        navigationController.pushViewController(controller1, animated: false)
        let controller2 = UIViewController()
        navigationController.pushViewController(controller2, animated: false)
        let controller3 = UIViewController()
        navigationController.pushViewController(controller3, animated: false)
        XCTAssertFalse(navigationController.popToViewControllerCalled, "The navigation controller should not indicate having had popToViewController called by default")
        XCTAssertNil(navigationController.popToViewControllerViewController, "The view controller should be missing by default")
        XCTAssertNil(navigationController.popToViewControllerAnimated, "The animated flag should be missing by default")
        let poppedControllers = navigationController.popToViewController(controller1, animated: true) as? [UIViewController]
        XCTAssertTrue(navigationController.popToViewControllerCalled, "The navigation controller should now indicate having had popToViewController called")
        XCTAssertEqual(navigationController.popToViewControllerViewController!, controller1, "The view controller should be captured")
        XCTAssertTrue(navigationController.popToViewControllerAnimated!, "The animated flag should be captured")
        XCTAssertNil(poppedControllers, "The spy implementation should not return controllers when popping")
    }
*/
}


fileprivate extension UINavigationControllerSpyAssociations {

    static let allAssociations = [
        UINavigationControllerSpyAssociations.pushViewController
    ]

}
